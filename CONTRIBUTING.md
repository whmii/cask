# Contributing to Cask

## Geting started started

1. Fork the repository.

2. Make your changes in a topic branch.

3. Make sure you have node & npm installed by running ↴.

    ```bash
    $ npm -v
    ```

    If you don't have it, you can download it [here](https://nodejs.org/).

4. Next up, `cd` in to bitters and run `npm install`.

    ```bash
    $ cd cask
    $ npm install
    ```
  Then Run the gulp build command.

    ```bash
    $ gulp
    ```

  This will have gulp compile the stylesheets from `app/assets/stylesheets` and
  link them to a test page so you can preview your changes!!

5. Rebase against `origin/master`, push to your fork and submit a pull request.

6. If you are writing a new feature please add documentation for it by making another pull request to the `gh_pages` branch.

At this point you're waiting on us. We like to at least comment on, if not
accept, pull requests within three business days (and, typically, one business
day). We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Fix a bug, refactor code or expand an existing feature.
* Use the right syntax and naming conventions.
* Update parts of the documentation that are affected by your contribution.

## Git Commit Messages

* Capitalize your commit messages.
* Start your message with a verb.
* Use present tense.
* Refer to the issue/PR number in your squashed commit message.

## SCSS Style Guide

* Two spaces, no tabs.
* Dashes instead of underscores or camel case: `section-header` **not** `section_header` or `sectionHeader`
* Names should be descriptive and written in full-words: `$base-font-color` **not** `$color` or `$txtCLR`
* Space between property and value: `width: 20px` **not** `width:20px`
* Declarations within a block should be ordered alphabetically.
* Blank lines between rules.
* No trailing whitespace. Blank lines should not have any space.
