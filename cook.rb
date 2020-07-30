class Cook < Formula
  desc "command line recipe management"
  homepage "https://github.com/ysim/cook"
  url "https://github.com/ysim/cook/releases/download/v0.1.1/cook-darwin-v0.1.1.tar.gz"
  sha256 "e11e651c14a4655508e6d55780980490acc131175baf4098ab63f99647bbd793"

  bottle :unneeded

  resource "completion" do
    url "https://github.com/ysim/cook/archive/v0.1.1.tar.gz"
    sha256 "e29494e63aa9eafbd07b95c9c2b863b3145f85812e569739b9299591afcb536c"
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
