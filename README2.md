<div id="top"></div>

[![LinkedIn][linkedin-shield]][https://www.linkedin.com/in/shahzad-rasul-a4037b194/]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/shahzadrasul/terraformbyshahzad">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Terraform for S3</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/shahzadrasul/terraformbyshahzad"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    ·
    ·
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">WHAT THIS REPO COVERS</a>
      <ul>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://registry.terraform.io/)

Here's a blank template to get started: To avoid retyping too much info. Do a search and replace with your text editor for the following: `shahzadrasul`, `terraformbyshahzad`, `https://www.linkedin.com/in/shahzad-rasul-a4037b194/`

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Terraform](https://registry.terraform.io/)
* [AWS S3](https://aws.amazon.com/s3/)
* [AWS Lambda](https://aws.amazon.com/lambda/features/)
* [Jenkins](https://www.jenkins.io/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- WHAT THIS REPO COVERS -->
## S3 buckets written in Terraform
### Create two S3 buckets namely: bucket_a and bucket_b 
### IAM users and roles written in Terraform
### Create two S3 buckets namely: usera and userb 
### Lambda function written in Python to strip image from its exif data
### Create a Lambda function that takes a .jpg/.jpeg image from bucket_a, removes the exif data and puts it in bucket_b.
### Jenkinsfile to run the Terraform job with Slack notification using GitHub webhook.
### SNS topic & SNS notifcation to take changes from S3 object put in S3 bucket for Lambda to build it's Python code.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - shahzad.rasul123@outlook.com

Project Link: [https://github.com/github_username/repo_name](https://github.com/shahzadrasul/terraformbyshahzad)

<p align="right">(<a href="#top">back to top</a>)</p>



<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo_name/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png