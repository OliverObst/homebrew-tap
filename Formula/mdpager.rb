class Mdpager < Formula
  desc "Native terminal pager for Markdown"
  homepage "https://github.com/OliverObst/mdpager"
  url "https://github.com/OliverObst/mdpager/releases/download/v0.1.0/mdpager-0.1.0-source.tar.gz"
  sha256 "a0ef245800e84b6772d801d99a7b2c1a81ccc697ccae33334dd3dfac528e0e04"
  license "BSD-2-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/mdpager.1"
  end

  test do
    (testpath/"example.md").write "# Hello\n"
    assert_match "Hello", shell_output("#{bin}/mdpager --no-pager --color=never example.md")
  end
end
