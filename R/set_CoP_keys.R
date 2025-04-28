# Set REDCap server URI and token for project
keyring::key_set(service = "cholera.cop", username = "redcap.uri", keyring = "system")
keyring::key_set(service = "cholera.cop", username = "redcap.token", keyring = "system")
Sys.setenv(redcap.token = keyring::key_get("cholera.cop", "redcap.token"))
Sys.setenv(redcap.uri = keyring::key_get("cholera.cop", "redcap.uri"))
