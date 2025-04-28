# Correlates of Protection (CoP) for Cholera
The goal of this repository and associated reports and dashboards is pull, process, and visualize data from participants recruited into the Correlates of Protection for Cholera study.

## Installation

You can install the version from GitHub by directly cloning the repository and then using:

```r
# Install the package directly from this repository
devtools::install_local("path-to-this-repository", force = TRUE)
```

## Clinical data

The `redcap_read()` function is the basic function to pull data from the REDCap project and return one row per record ID. Data are pulled from the REDCap API with the [REDCapR package](https://github.com/OuhscBbmc/REDCapR) and requires the following inputs:  
1. The uniform resource identifier (URI) of the REDCap project  
2. A 32-character hexadecimal string (i.e. API token) associated with a REDCap account that has permission to export data (see _API_ and _User Rights_ in REDCap for more information).   

We **strongly** recommend secure practices to store tokens, such as the [keyring package](https://github.com/r-lib/keyring) as used in the examples below. 

```r
# The following commands will prompt you to enter the API uri and project tokens. You will only have to do this one time.

# Run the command:
keyring::key_set(service = "cholera.cop", username = "redcap.uri")
## Then paste the uri of the project in the pop-up that appears.

# Run the command:
keyring::key_set(service = "cholera.cop", username = "redcap.token")
## Then paste your unique API token for the mpox project in the pop-up that appears.

# Example
cholera_cop_dat <- REDCapR::redcap_read(token = keyring::key_get("cholera.cop", "redcap.token"),
                               redcap_uri = keyring::key_get("cholera.cop", "redcap.uri"),
                               batch_size = 300L,
                               interbatch_delay = 0.2,
                               raw_or_label = "label")$data %>%
    dplyr::tibble()
```