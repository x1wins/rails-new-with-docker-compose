class RailsDockerGen < Formula
  desc "Generate Rails projects with Docker Compose and PostgreSQL"
  homepage "https://github.com/x1wins/rails-new-with-docker-compose"
  url "https://github.com/x1wins/rails-new-with-docker-compose/archive/refs/tags/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "" # Calculate with: shasum -a 256 <downloaded-tarball>

  depends_on "docker" => :recommended
  depends_on "docker-compose" => :recommended

  def install
    libexec.install Dir["*"]
    
    # Create wrapper script
    (bin/"rails-docker-gen").write <<~EOS
      #!/bin/bash
      CURRENT_DIR="$(pwd)"
      cd "#{libexec}"
      ./generate_rails_project.sh "$1" "$CURRENT_DIR"
    EOS
    
    chmod 0755, bin/"rails-docker-gen"
  end

  def caveats
    <<~EOS
      Docker and Docker Compose are required to use this tool.
      
      Usage:
        rails-docker-gen my-project
      
      This will create a new Rails project with PostgreSQL in your current directory.
    EOS
  end

  test do
    system "#{bin}/rails-docker-gen"
  end
end
