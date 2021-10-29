# SSS3
## _Simple Storage Scanner_
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

SSS3 is a simple S3 Bucket testing software. It uses aws cli find for public buckets in a list of domains/subdomains. 

- It requires aws cli installed and configured with a s3 policy defined
- You should have a list of previous enumerated domains/subdomains

## Features

- Iterates a list of domains/subdomains
- Tests if a domain/subdomain respond to a bucket and if its permissions for listing are enabled
- Export the result of listing of buckets found

## Installation

Clone the repository, give +x to script and be happy
SSS3 requires [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html) to run.

```sh
$ git clone https://github.com/halencarjunior/sss3.git
$ chmod +x sss3.sh
$ ./ss3.sh domain.txt -o output.txt
```

## Usage example

You could start enumerating a domain using [Amass](https://github.com/OWASP/Amass/blob/master/doc/user_guide.md)

```sh
$ amass enum -d example.com -o domains-example-com.txt
./sss3.sh domains-example-com.txt -o output-example-com.txt
```

## Development

Want to contribute? Great! Please send your PR for us and we'll be greateful for your help.
**Free Software, Hell Yeah!**
