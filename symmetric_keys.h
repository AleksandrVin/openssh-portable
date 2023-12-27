/**
 * @file symmetric_keys.h
 * @brief Header file for symmetric_keys.c
 * @author Aleksandr Vinogradov 
 * 
 * This file contains the function prototypes for symmetric_keys.c
 * For creating, loading symmetric keys
 * 
 * For now, keys are stored binary in files for aes-256-cbc cipher only. 
 * Size is fixed to 32 bytes.
*/

#define SYMMETRIC_KEY_SIZE 32

struct symmetric_key {
    unsigned char key[SYMMETRIC_KEY_SIZE];
};

int load_symmetric_key(char *key_file_name, struct symmetric_key *key);