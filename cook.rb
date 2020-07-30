class Cook < Formula
  desc "command line recipe management"
  homepage "https://github.com/ysim/cook"
  url "https://github.com/ysim/cook/releases/download/v0.1.0/cook-darwin-v0.1.0.tar.gz"
  sha256 "f657c8f46d6a4557c4e8d6dba12547569ac71315997724e4913abe9132a0be63"

  bottle :unneeded

  resource "completion" do
    url "https://github.com/ysim/cook/archive/v0.1.0.tar.gz"
    sha256 "2d56ddbc64592285991b7bddbac5719f3122fd33d4d735caf32f4249e1633580"
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
