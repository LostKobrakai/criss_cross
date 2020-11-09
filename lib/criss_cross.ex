defmodule CrissCross do
  @external_resource "README.md"
  @moduledoc "README.md"
             |> File.read!()
             |> String.split("<!-- MDOC !-->")
             |> Enum.fetch!(1)

  @base "_build/erts"

  def ubuntu(os_version, otp_version) do
    os = validate_os_version!(os_version)
    file = Path.join([@base, os, "#{otp_version}.tar.gz"])
    root = Path.dirname(file)
    File.mkdir_p!(root)
    dir = Path.rootname(file, ".tar.gz")

    Mix.shell().info("Cross compiling for #{os} using #{otp_version}.")

    unless File.dir?(dir) do
      Mix.shell().info("Downloading precompiled beam…")

      {:ok, :saved_to_file} =
        :httpc.request(
          :get,
          {~c"https://repo.hex.pm/builds/otp/#{os}/#{otp_version}.tar.gz", []},
          [],
          body_format: :binary,
          stream: ~c"#{file}"
        )

      Mix.shell().info("Extracting files…")
      extract_tar(~c"#{file}", ~c"#{root}")
      File.rm!(file)
    end

    [erts] = Path.wildcard(Path.join(dir, "erts-*"))
    erts
  end

  defp validate_os_version!(14), do: "ubuntu-14.04"
  defp validate_os_version!(16), do: "ubuntu-16.04"
  defp validate_os_version!(18), do: "ubuntu-18.04"
  defp validate_os_version!(20), do: "ubuntu-20.04"

  defp validate_os_version!(other) do
    raise "Invalid ubuntu version: #{other}"
  end

  defp extract_tar(filename, root) do
    :erl_tar.extract(filename, [:compressed, cwd: root])
  end
end
