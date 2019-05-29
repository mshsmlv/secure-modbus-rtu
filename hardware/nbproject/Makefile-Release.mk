#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=arm-none-eabi-gcc
CCC=arm-none-eabi-g++
CXX=arm-none-eabi-g++
FC=gfortran
AS=arm-none-eabi-as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/Startup/startup_mstn_MDR32F9Qx.o \
	${OBJECTDIR}/src/AES.o \
	${OBJECTDIR}/src/Serial.o \
	${OBJECTDIR}/src/main.o


# C Compiler Flags
CFLAGS=-mcpu=cortex-m3 -mthumb -MD -Wall -O2 -fdata-sections -ffunction-sections

# CC Compiler Flags
CCFLAGS=-mcpu=cortex-m3 -mthumb -MD -Wall -O2 -fdata-sections -ffunction-sections -fno-exceptions
CXXFLAGS=-mcpu=cortex-m3 -mthumb -MD -Wall -O2 -fdata-sections -ffunction-sections -fno-exceptions

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/opt/Intec/MSTN/M100/Lib/arm-none-eabi/

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/hardware

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/hardware: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/hardware ${OBJECTFILES} ${LDLIBSOPTIONS} -u _printf_float -mcpu=cortex-m3 -mthumb -lstdc++ -nostartfiles -lm -N -Ttext=0x08003000 -Tdata=0x20000000 --specs=nano.specs -Wl,--start-group -lgcc -lc -lm -lMSTN-M100 -Wl,--end-group -Wl,-gc-sections -ffreestanding -T/opt/Intec/MSTN/M100/Lib/arm-none-eabi/MSTN_M100_User.ld -Wl,--start-group -lgcc -lc -lm -lMSTN-M100 -Wl,--end-group

${OBJECTDIR}/Startup/startup_mstn_MDR32F9Qx.o: Startup/startup_mstn_MDR32F9Qx.S
	${MKDIR} -p ${OBJECTDIR}/Startup
	${RM} "$@.d"
	$(COMPILE.c) -O2 -DF_CPU=80000000 -DMSTN=100 -DUSE_MDR1986VE9x -D__MODE_USER -D__NO_SYSTEM_INIT -D__STARTUP_CLEAR_BSS -D_start=mstn_main -I./Startup -I./src -I/opt/Intec/MSTN/M100/Inc/MSTN -I/opt/Intec/MSTN/M100/Inc/SPL_MDR -I/opt/Intec/MSTN/M100/Inc/Cpp -I/opt/Intec/MSTN/M100/Inc/Core -I/opt/Intec/MSTN/M100/Inc/Device -I./ -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Startup/startup_mstn_MDR32F9Qx.o Startup/startup_mstn_MDR32F9Qx.S

${OBJECTDIR}/src/AES.o: src/AES.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DF_CPU=80000000 -DMSTN=100 -DUSE_MDR1986VE9x -D__MODE_USER -D__NO_SYSTEM_INIT -D__STARTUP_CLEAR_BSS -D_start=mstn_main -I./Startup -I./src -I/opt/Intec/MSTN/M100/Inc/MSTN -I/opt/Intec/MSTN/M100/Inc/SPL_MDR -I/opt/Intec/MSTN/M100/Inc/Cpp -I/opt/Intec/MSTN/M100/Inc/Core -I/opt/Intec/MSTN/M100/Inc/Device -I./ -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/AES.o src/AES.cpp

${OBJECTDIR}/src/Serial.o: src/Serial.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DF_CPU=80000000 -DMSTN=100 -DUSE_MDR1986VE9x -D__MODE_USER -D__NO_SYSTEM_INIT -D__STARTUP_CLEAR_BSS -D_start=mstn_main -I./Startup -I./src -I/opt/Intec/MSTN/M100/Inc/MSTN -I/opt/Intec/MSTN/M100/Inc/SPL_MDR -I/opt/Intec/MSTN/M100/Inc/Cpp -I/opt/Intec/MSTN/M100/Inc/Core -I/opt/Intec/MSTN/M100/Inc/Device -I./ -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Serial.o src/Serial.cpp

${OBJECTDIR}/src/main.o: src/main.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DF_CPU=80000000 -DMSTN=100 -DUSE_MDR1986VE9x -D__MODE_USER -D__NO_SYSTEM_INIT -D__STARTUP_CLEAR_BSS -D_start=mstn_main -I./Startup -I./src -I/opt/Intec/MSTN/M100/Inc/MSTN -I/opt/Intec/MSTN/M100/Inc/SPL_MDR -I/opt/Intec/MSTN/M100/Inc/Cpp -I/opt/Intec/MSTN/M100/Inc/Core -I/opt/Intec/MSTN/M100/Inc/Device -I./ -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/main.o src/main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
