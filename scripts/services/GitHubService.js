/* eslint-disable no-console */
const fetchModule = require("node-fetch");

const IS_DEBUG = () => Boolean(process.env.DEBUG);

function responseHandler(response) {
  if (response.ok) {
    return response.json();
  }
  throw new Error(response.statusText);
}

function GitHubService(GITHUB_TOKEN = "not found", fetch = fetchModule) {
  const BASE_URL = "https://api.github.com";
  const defaultHeaders = {
    authorization: `token ${GITHUB_TOKEN}`,
    accept:
      "application/vnd.github.v3+json; application/vnd.github.antiope-preview+json",
    "content-type": "application/json",
  };

  return {
    checkPRStatus({ GITHUB_REPOSITORY, PR_NUMBER }) {
      return fetch(
        `${BASE_URL}/repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}`,
        {
          headers: defaultHeaders,
        }
      ).then(responseHandler);
    },
    commentOnGithub({ commentBody, GITHUB_REPOSITORY, PR_NUMBER }) {
      console.log("\n\n[commentOnGithub_start]");
      console.log({
        GITHUB_TOKEN,
        commentBody,
        GITHUB_REPOSITORY,
        PR_NUMBER,
      });
      if (IS_DEBUG()) {
        console.log(commentBody);
      } else {
        fetch(
          `${BASE_URL}/repos/${GITHUB_REPOSITORY}/issues/${PR_NUMBER}/comments`,
          {
            headers: defaultHeaders,
            method: "POST",
            body: JSON.stringify({
              body: commentBody,
            }),
          }
        )
          .then(responseHandler)
          .catch((err) => {
            throw err;
          })
          .finally(() => console.log("[commentOnGithub_finish]"));
      }
    },
  };
}

module.exports = {
  GitHubService,
};
