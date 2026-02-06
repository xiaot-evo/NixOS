{ pkgs-master, ... }:
{
  programs.opencode = {
    enable = true;
    package = pkgs-master.opencode;
    settings = {
      # theme = "opencode";
      # model = "anthropic/claude-sonnet-4-20250514";
      # autoshare = false;
      # autoupdate = true;
      # permission = {
      #   edit = "ask";
      # };
    };
    agents = {
      # code-reviewer = ''
      #   # Code Reviewer Agent

      #   You are a senior software engineer specializing in code reviews.
      #   Focus on code quality, security, and maintainability.

      #   ## Guidelines
      #   - Review for potential bugs and edge cases
      #   - Check for security vulnerabilities
      #   - Ensure code follows best practices
      #   - Suggest improvements for readability and performance
      # '';
      # documentation = ./agents/documentation.md;
    };
  };
}
