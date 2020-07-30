class Cook < Formula
  desc "command line recipe management"
  homepage "https://github.com/ysim/cook"
  url "https://github.com/ysim/cook/releases/download/v0.2.0/cook-darwin-v0.2.0.tar.gz"
  sha256 "ae84f1ba8271f93b2d654024267832701dd10f19a6eb1889efa9c80044b32f68"

  bottle :unneeded

  resource "completion" do
    url "https://github.com/ysim/cook/archive/v0.2.0.tar.gz"
    sha256 "ccf5efca742ffcaf297807354a545d4af101227f5679d64ef2de09816866e2a4"
  end

  def install
    bin.install "cook"
    resource("completion").stage { system "make", "bash_completion_dir=#{bash_completion}", "install-bash-completion"}
  end

  test do
    system "#{bin}/cook", "version"
    system "complete", "-p"
  end
end
