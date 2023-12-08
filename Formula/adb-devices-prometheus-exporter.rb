# typed: false
# frozen_string_literal: true

class AdbDevicesPrometheusExporter < Formula
    desc "Prometheus exporter for expose 'adb devices' on host"
    homepage "https://github.com/WindSekirun/adb-devices-prometheus-exporter"
    version "0.1.0"
    license "MIT License"

    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/WindSekirun/adb-devices-prometheus-exporter/releases/download/v0.1.0/adb-devices-prometheus-exporter-Darwin-x86_64.tar.gz"
        sha256 "c3e5d163925851c8cb5b064e00495890fe5b6661553e62f609da203840e055bd"
  
        def install
          bin.install "adb-devices-prometheus-exporter"
        end
      end
      if Hardware::CPU.arm?
        url "https://github.com/WindSekirun/adb-devices-prometheus-exporter/releases/download/v0.1.0/adb-devices-prometheus-exporter-Darwin-aarch64.tar.gz"
        sha256 "565d204624dabbca4cd300170deb75330c89cd00b100dc29d82e4b74319c5cd8"
  
        def install
          bin.install "adb-devices-prometheus-exporter"
        end
      end
    end

    service do
      run "#{opt_bin}/adb-devices-prometheus-exporter"
      environment_variables PATH: std_service_path_env
      keep_alive true
      process_type :interactive
    end
  end
  