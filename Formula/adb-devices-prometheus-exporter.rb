# typed: false
# frozen_string_literal: true

class AdbDevicesPrometheusExporter < Formula
  desc "Prometheus exporter for expose 'adb devices' on host"
  homepage "https://github.com/WindSekirun/adb-devices-prometheus-exporter"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/WindSekirun/adb-devices-prometheus-exporter/releases/download/v0.2.0/adb-devices-prometheus-exporter-Darwin-x86_64.tar.gz"
      sha256 "cfccde82f846759d69e736d9a95f9bdf292e39d4f20cdaa27e7e49b531df18e6"

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
