/* eslint-disable no-console */
const shelljs = require("shelljs");
const dotenv = require("dotenv");
const { GitHubService } = require("./services/GitHubService.js");

dotenv.config();

// [Enviroment Variables]
const { GITHUB_TOKEN, GITHUB_REPOSITORY, GITHUB_PR_NUMBER } = process.env;
// =========================

// [Deploy to Vercel]
const command = `yarn deploy:flutterweb:demo_base`;
const output = shelljs.exec(command);
// =========================
const commandLines = output.stdout.split("\n");
console.log(commandLines);
const vercelUrl = commandLines[commandLines.length - 1];

// [Comment to GitHub]
GitHubService(GITHUB_TOKEN).commentOnGithub({
  PR_NUMBER: GITHUB_PR_NUMBER,
  GITHUB_REPOSITORY,
  commentBody: `
- Deploy URL (WebApp): [${vercelUrl}](${vercelUrl})
`,
});
// =========================
