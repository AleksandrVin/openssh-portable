/**
 * @file symmetric_keys.c
 * @brief Functions for symmetric key generation and loading
*/

#include "symmetric_keys.h"

#include "ssherr.h"
#include "log.h"

#include "stdio.h"

int load_symmetric_key(char *key_file_name, struct  symmetric_key *key)
{
    FILE * file;

    file = fopen(key_file_name, "r");
    if(file == NULL)
    {
        debug("Error opening file %s", key_file_name);
        return SSH_ERR_SYSTEM_ERROR;
    }

    for(int i = 0; i < SYMMETRIC_KEY_SIZE; i += 4)
    {
        if(fscanf(file, "%08x", &key->key[i]) != 4)
        {
            debug("Error reading key from file %s", key_file_name);
            fclose(file);
            return SSH_ERR_SYSTEM_ERROR;
        }
    }

    fclose(file);
    return 0;
}