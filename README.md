# 🎵 Creating Multiple Spotify Playlists Using Terraform

This project demonstrates how to use Terraform to create and manage multiple Spotify playlists for different occasions such as morning, evening, and party night. By automating the playlist creation process with Terraform, you can efficiently manage your Spotify playlists without manual intervention.

## Project Overview

This project involves setting up Terraform to automate the creation of multiple Spotify playlists. You’ll use Terraform to define and manage these playlists, making use of the Spotify API.

## Prerequisites

Before you start, ensure you have the following:

- **Terraform Installed**: Ensure Terraform is installed on your machine. [Download Terraform](https://www.terraform.io/downloads.html)
- **Docker Installed**: Make sure Docker is installed and running. [Install Docker](https://docs.docker.com/get-docker/)
- **Spotify Account**: You need a Spotify account (no premium access required).
- **Spotify Developer Account**: Register and create an application on the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications) to get the Client ID and Client Secret.
- **Spotify Provider for Terraform**: Install and configure the Spotify provider for Terraform.
- **VS Code Editor**: Recommended for editing Terraform files. [Download VS Code](https://code.visualstudio.com/)

## Steps to Complete the Project

### 1. Create Terraform Project

- **Create a Directory**: Start by setting up your Terraform project. Create a new directory for your project and navigate to it:

  ```bash
  mkdir spotify-playlists-terraform
  cd spotify-playlists-terraform
  ```

- **Create `main.tf`**: Inside this directory, create a file named `main.tf` for your Terraform configuration.

### 2. Define Provider

In `main.tf`, define the Spotify provider. Here’s a basic example:

```hcl
terraform {
  required_providers {
    spotify = {
      source = "conradludgate/spotify"
      version = "0.2.7"
    }
  }
}

provider "spotify" {
  api_key = var.api_key
}
```

### 3. Obtain API Key

To interact with Spotify’s API, you need to obtain a Client ID and Client Secret. 

### 4. Create Spotify App

- Go to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications).
- Log in with your Spotify account.
- Click on "Create an App" and fill in the required details:

  - **Name**: Your app’s name
  - **Description**: My Playlist through Terraform
  - **Redirect URIs**: `http://localhost:27228/spotify_callback`
- Click on Settings and note down the Client ID and Client Secret.

### 5. Enter Details

- **Create a `.env` File**: Create a file named `.env` to store your Spotify application's Client ID and Secret:

  ```env
  CLIENT_ID=your_client_id
  CLIENT_SECRET=your_client_secret
  ```

### 6. Run the Spotify Auth App and Get the API Key

- Ensure Docker Desktop is running.
- Start the authorization proxy server:

  ```bash
  docker run --rm -it -p 27228:27228 --env-file .env ghcr.io/conradludgate/spotify-auth-proxy
  ```
The command is used to run the Spotify authorization proxy server, which is a crucial part of the process for obtaining an API key (also known as an access token) required to interact with Spotify's API.

### 7. Provider.tf
```hcl
  data "spotify_search_track" "karan"{
  artist = "Karan Aujla"
}

resource "spotify_playlist" "Jaskaran" {
  name = "Aujla-ni-Aujla"
  tracks = [data.spotify_search_track.karan.tracks[0].id,
  data.spotify_search_track.karan.tracks[1].id,
  data.spotify_search_track.karan.tracks[2].id,
  data.spotify_search_track.karan.tracks[3].id,
  data.spotify_search_track.karan.tracks[4].id,
  data.spotify_search_track.karan.tracks[5].id,
  data.spotify_search_track.karan.tracks[6].id
  ] 

}
```
Purpose: The spotify_search_track data source is used to search for tracks by the artist "Karan Aujla" on Spotify.
Functionality: It retrieves a list of tracks that match the search criteria (i.e., tracks by "Karan Aujla").
tracks: This field is an array that includes the first seven tracks returned by the spotify_search_track data source. Each track's ID is referenced using data.spotify_search_track.karan.tracks[index].id, where index ranges from 0 to 6.

## Usage

- **Initialize Terraform**: Run the following command to initialize Terraform and download the required provider:

  ```bash
  terraform init
  ```

- **Plan and Apply**: Review the actions Terraform will take and then apply the configuration:

  ```bash
  terraform plan
  terraform apply
  ```

## Security

- Ensure that your `.env` file containing sensitive information like your Client ID and Client Secret is not committed to Git. Add it to `.gitignore`:

  ```bash
  echo ".env" >> .gitignore
  ```


# Playlist

![image](https://github.com/user-attachments/assets/8676482e-5d99-48b2-9b2d-b20915031819)

