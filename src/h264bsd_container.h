/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*------------------------------------------------------------------------------

    Table of contents

    1. Include headers
    2. Module defines
    3. Data types
    4. Function prototypes

------------------------------------------------------------------------------*/

#ifndef H264SWDEC_CONTAINER_H
#define H264SWDEC_CONTAINER_H

/*------------------------------------------------------------------------------
    1. Include headers
------------------------------------------------------------------------------*/

#include "basetype.h"
#include "h264bsd_storage.h"

/*------------------------------------------------------------------------------
    2. Module defines
------------------------------------------------------------------------------*/

/* String length for tracing */
#define H264DEC_TRACE_STR_LEN 100

/*------------------------------------------------------------------------------
    3. Data types
------------------------------------------------------------------------------*/

typedef enum {
    UNINITIALIZED,
    INITIALIZED,
    NEW_HEADERS
} decStat_enum;

typedef struct
{
    decStat_enum decStat;

    u32 picNumber;
    storage_t storage;
#ifdef H264DEC_TRACE
    char str[H264DEC_TRACE_STR_LEN];
#endif
} decContainer_t;

/*------------------------------------------------------------------------------
    4. Function prototypes
------------------------------------------------------------------------------*/

#endif /* #ifdef H264SWDEC_DECCONTAINER_H */

