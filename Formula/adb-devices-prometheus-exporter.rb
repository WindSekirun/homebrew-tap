# typed: false
# frozen_string_literal: true

class AdbDevicesPrometheusExporter < Formula
  desc "Prometheus exporter for expose 'adb devices' on host"
  homepage "https://github.com/WindSekirun/adb-devices-prometheus-exporter"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/WindSekirun/adb-devices-prometheus-exporter/releases/download/v0.2.3/adb-devices-prometheus-exporter-Darwin-x86_64.tar.gz"
      sha256 "990869230201d6b8ebf485136ce4bbf4bc54adb7fb623be7de62e09201c6f150"

      def install
        bin.install "adb-devices-prometheus-exporter"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/WindSekirun/adb-devices-prometheus-exporter/releases/download/v0.2.3/adb-devices-prometheus-exporter-Darwin-aarch64.tar.gz"
      sha256 "e237538880db7dc19bbd82342d562941999a68b29693cc57b99aca5f5b33217a"

      def install
        bin.install "adb-devices-prometheus-exporter"
      end
    end
  end

  service do
    run "#{opt_bin}/adb-devices-prometheus-exporter -f"
    environment_variables PATH: std_service_path_env
    keep_alive true
    process_type :interactive
  end
end
