# APT Boto S3

![](https://i.imgur.com/waxVImv.png)
### [View all Roadmaps](https://github.com/nholuongut/all-roadmaps) &nbsp;&middot;&nbsp; [Best Practices](https://github.com/nholuongut/all-roadmaps/blob/main/public/best-practices/) &nbsp;&middot;&nbsp; [Questions](https://www.linkedin.com/in/nholuong/)
<br/>

The *fast* and *simple* S3 transport for apt.

Access S3-hosted apt repositories via the AWS APIs.

## Why apt-boto-s3?

[apt-s3/apt-transport-s3](https://github.com/castlabs/apt-s3), this project has

* standard AWS credential resolution, including environment variables and ~/.aws/credentials
* pipelining requests for faster updates
* Last-Modified caching
* broad AWS API support, e.g. v4 credentials
* operability with any S3-compatible API
* works with all standard digest algorithms
* Apache 2.0 license

## Installing

There's not a debian package (yet) for apt-boto-s3, but installation is straightforward.

Python 2.7 and the AWS Python SDK (boto) are required.

```
apt-get install python python-pip
pip install boto3
```

Then add the `s3` transport method

```
curl -o /usr/lib/apt/methods/s3 https://raw.githubusercontent.com/nholuongut/apt-boto-s3/master/s3.py
chmod 755 /usr/lib/apt/methods/s3
```

or clone this repo and run `./install`.

## Usage

### URLs

The URL in apt sources can have any of the formats [documented](http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html#access-bucket-intro) by AWS.

```
# path style
deb s3://s3.amazonaws.com/my-bucket jessie main contrib

# path style for region other than us-east-1
deb s3://s3-sa-east-1.amazonaws.com/my-bucket jessie main contrib

# virtual-hosted style
deb s3://my-bucket.s3.amazonaws.com jessie main contrib
```

Any endpoint can be used that has an S3-compatible API.

```
deb s3://swift.example.com/my-bucket jessie main contrib
```

### Credentials

apt-boto-s3 resolves AWS credentials in the usual manner.

1. Environment variables: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
1. Credentials file: `~/.aws/credentials`
1. Instance metadata: http://169.254.169.254

Credentials may be also be specified in in the [user information](https://tools.ietf.org/html/rfc3986#section-3.2.1) of the URL. The key and secret should be [URL-encoded](https://tools.ietf.org/html/rfc3986#section-2.1).

```
deb s3://AWS_ACCESS_KEY:AWS_SECRET_KEY@my-bucket.s3.amazonaws.com jessie main contrib
deb s3://AKIAIOSFODNN7EXAMPLE:wJalrXUtnFEMI%2FK7MDENG%2FbPxRfiCYEXAMPLEKEY@my-bucket.s3.amazonaws.com jessie main contrib
```

Inline URL credentials take precendent when present.

#### Signature version

Some regions, e.g. eu-central-1, support only AWS version 4 signatures. However, this version does not work with virtual-hosted style URLs. And many S3 clones support only version 2.

apt-boto-s3 uses version 4 for s3*.amazonaws.com path style URLs; otherwise it uses version 2.

This should just work, but if you need to override this default, set `S3::Signature::Version` in apt configuration, e.g. in `/etc/apt/apt.conf.d/s3`:

```
S3::Signature::Version "2";
```

# 🚀 I'm are always open to your feedback.  Please contact as bellow information:
### [Contact ]
* [Name: Nho Luong]
* [Skype](luongutnho_skype)
* [Github](https://github.com/nholuongut/)
* [Linkedin](https://www.linkedin.com/in/nholuong/)
* [Email Address](luongutnho@hotmail.com)
* [PayPal.me](https://www.paypal.com/paypalme/nholuongut)

![](https://i.imgur.com/waxVImv.png)
![](Donate.png)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/nholuong)

# License
* Nho Luong (c). All Rights Reserved.🌟
