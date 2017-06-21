class Cook < Formula
  desc "command line recipe management"
  homepage "https://github.com/ysim/cook"
  url "https://github.com/ysim/cook/releases/download/v0.1.0/cook-v0.1.0.tar.gz"
  sha256 "92a76228f004e6f00ede10eb86c9e2306f53b11f67d5b3081b958c66b45f8466"

  bottle :unneeded

  resource "completion" do
    url "https://github.com/ysim/cook/archive/v0.1.0.tar.gz"
    sha256 "b59554766f5c00c5e912c663141f8cb62643876373977d8cddb5ba7a01e9833c"
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
