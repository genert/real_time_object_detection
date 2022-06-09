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

#ifndef H264SWDEC_VLC_H
#define H264SWDEC_VLC_H

/*------------------------------------------------------------------------------
    1. Include headers
------------------------------------------------------------------------------*/

#include "inc/basetype.h"
#include "h264bsd_stream.h"
#include "h264bsd_transform.h"

/*------------------------------------------------------------------------------
    2. Module defines
------------------------------------------------------------------------------*/


/*------------------------------------------------------------------------------
    3. Data types
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
    4. Function prototypes
------------------------------------------------------------------------------*/

u32 h264bsdDecodeExpGolombUnsigned(strmData_t *pStrmData, u32 *value);

u32 h264bsdDecodeExpGolombSigned(strmData_t *pStrmData, i32 *value);

u32 h264bsdDecodeExpGolombMapped(strmData_t *pStrmData, u32 *value,
    u32 isIntra);

u32 h264bsdDecodeExpGolombTruncated(strmData_t *pStrmData, u32 *value,
    u32 greaterThanOne);

#endif /* #ifdef H264SWDEC_VLC_H */

