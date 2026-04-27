#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/filters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/filters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../rev_lib/adc.c ../rev_lib/debounce.c ../rev_lib/lcd.c ../rev_lib/millis.c ../rev_lib/mpu6500.c ../rev_lib/uart.c ../rev_lib/w25qxx.c ../rev_lib/dac.c main_filters.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/580844646/adc.o ${OBJECTDIR}/_ext/580844646/debounce.o ${OBJECTDIR}/_ext/580844646/lcd.o ${OBJECTDIR}/_ext/580844646/millis.o ${OBJECTDIR}/_ext/580844646/mpu6500.o ${OBJECTDIR}/_ext/580844646/uart.o ${OBJECTDIR}/_ext/580844646/w25qxx.o ${OBJECTDIR}/_ext/580844646/dac.o ${OBJECTDIR}/main_filters.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/580844646/adc.o.d ${OBJECTDIR}/_ext/580844646/debounce.o.d ${OBJECTDIR}/_ext/580844646/lcd.o.d ${OBJECTDIR}/_ext/580844646/millis.o.d ${OBJECTDIR}/_ext/580844646/mpu6500.o.d ${OBJECTDIR}/_ext/580844646/uart.o.d ${OBJECTDIR}/_ext/580844646/w25qxx.o.d ${OBJECTDIR}/_ext/580844646/dac.o.d ${OBJECTDIR}/main_filters.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/580844646/adc.o ${OBJECTDIR}/_ext/580844646/debounce.o ${OBJECTDIR}/_ext/580844646/lcd.o ${OBJECTDIR}/_ext/580844646/millis.o ${OBJECTDIR}/_ext/580844646/mpu6500.o ${OBJECTDIR}/_ext/580844646/uart.o ${OBJECTDIR}/_ext/580844646/w25qxx.o ${OBJECTDIR}/_ext/580844646/dac.o ${OBJECTDIR}/main_filters.o

# Source Files
SOURCEFILES=../rev_lib/adc.c ../rev_lib/debounce.c ../rev_lib/lcd.c ../rev_lib/millis.c ../rev_lib/mpu6500.c ../rev_lib/uart.c ../rev_lib/w25qxx.c ../rev_lib/dac.c main_filters.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/filters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=AVR128DB48
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/580844646/adc.o: ../rev_lib/adc.c  .generated_files/flags/default/bb22df1217adb244a852c8b59832271b478d2841 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/adc.o.d" -MT "${OBJECTDIR}/_ext/580844646/adc.o.d" -MT ${OBJECTDIR}/_ext/580844646/adc.o -o ${OBJECTDIR}/_ext/580844646/adc.o ../rev_lib/adc.c 
	
${OBJECTDIR}/_ext/580844646/debounce.o: ../rev_lib/debounce.c  .generated_files/flags/default/e5261c1bfa2f5417901e3cb0e6596c4c9b9abdd7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/debounce.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/debounce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/debounce.o.d" -MT "${OBJECTDIR}/_ext/580844646/debounce.o.d" -MT ${OBJECTDIR}/_ext/580844646/debounce.o -o ${OBJECTDIR}/_ext/580844646/debounce.o ../rev_lib/debounce.c 
	
${OBJECTDIR}/_ext/580844646/lcd.o: ../rev_lib/lcd.c  .generated_files/flags/default/21eb84a9b66a37bedd9b15d433818f8d8d36588f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/lcd.o.d" -MT "${OBJECTDIR}/_ext/580844646/lcd.o.d" -MT ${OBJECTDIR}/_ext/580844646/lcd.o -o ${OBJECTDIR}/_ext/580844646/lcd.o ../rev_lib/lcd.c 
	
${OBJECTDIR}/_ext/580844646/millis.o: ../rev_lib/millis.c  .generated_files/flags/default/f553421e108d70e3cbf2f20df38944d39f5e8414 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/millis.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/millis.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/millis.o.d" -MT "${OBJECTDIR}/_ext/580844646/millis.o.d" -MT ${OBJECTDIR}/_ext/580844646/millis.o -o ${OBJECTDIR}/_ext/580844646/millis.o ../rev_lib/millis.c 
	
${OBJECTDIR}/_ext/580844646/mpu6500.o: ../rev_lib/mpu6500.c  .generated_files/flags/default/35a7e52171487f8a62aac0a390c091e3a8587480 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/mpu6500.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/mpu6500.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/mpu6500.o.d" -MT "${OBJECTDIR}/_ext/580844646/mpu6500.o.d" -MT ${OBJECTDIR}/_ext/580844646/mpu6500.o -o ${OBJECTDIR}/_ext/580844646/mpu6500.o ../rev_lib/mpu6500.c 
	
${OBJECTDIR}/_ext/580844646/uart.o: ../rev_lib/uart.c  .generated_files/flags/default/d6645e08025c9a10cab48081b761903987f1d8cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/uart.o.d" -MT "${OBJECTDIR}/_ext/580844646/uart.o.d" -MT ${OBJECTDIR}/_ext/580844646/uart.o -o ${OBJECTDIR}/_ext/580844646/uart.o ../rev_lib/uart.c 
	
${OBJECTDIR}/_ext/580844646/w25qxx.o: ../rev_lib/w25qxx.c  .generated_files/flags/default/e4ee05f2be4dd8034b4389c490fbf9fa378db785 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/w25qxx.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/w25qxx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/w25qxx.o.d" -MT "${OBJECTDIR}/_ext/580844646/w25qxx.o.d" -MT ${OBJECTDIR}/_ext/580844646/w25qxx.o -o ${OBJECTDIR}/_ext/580844646/w25qxx.o ../rev_lib/w25qxx.c 
	
${OBJECTDIR}/_ext/580844646/dac.o: ../rev_lib/dac.c  .generated_files/flags/default/36871e07d280157f2f91d9ab104579a21f507c37 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/dac.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/dac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/dac.o.d" -MT "${OBJECTDIR}/_ext/580844646/dac.o.d" -MT ${OBJECTDIR}/_ext/580844646/dac.o -o ${OBJECTDIR}/_ext/580844646/dac.o ../rev_lib/dac.c 
	
${OBJECTDIR}/main_filters.o: main_filters.c  .generated_files/flags/default/86bb1b8d13c1a231e16c0a7de732820b31ff2330 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_filters.o.d 
	@${RM} ${OBJECTDIR}/main_filters.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/main_filters.o.d" -MT "${OBJECTDIR}/main_filters.o.d" -MT ${OBJECTDIR}/main_filters.o -o ${OBJECTDIR}/main_filters.o main_filters.c 
	
else
${OBJECTDIR}/_ext/580844646/adc.o: ../rev_lib/adc.c  .generated_files/flags/default/3ca0c172fc272871e87f7e5c5aa84375e9d4d8c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/adc.o.d" -MT "${OBJECTDIR}/_ext/580844646/adc.o.d" -MT ${OBJECTDIR}/_ext/580844646/adc.o -o ${OBJECTDIR}/_ext/580844646/adc.o ../rev_lib/adc.c 
	
${OBJECTDIR}/_ext/580844646/debounce.o: ../rev_lib/debounce.c  .generated_files/flags/default/f2a08d0fe2eda3e7665733c41a79a5ce725526f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/debounce.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/debounce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/debounce.o.d" -MT "${OBJECTDIR}/_ext/580844646/debounce.o.d" -MT ${OBJECTDIR}/_ext/580844646/debounce.o -o ${OBJECTDIR}/_ext/580844646/debounce.o ../rev_lib/debounce.c 
	
${OBJECTDIR}/_ext/580844646/lcd.o: ../rev_lib/lcd.c  .generated_files/flags/default/20e285b1e85a944cae137994977a0f70996bab50 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/lcd.o.d" -MT "${OBJECTDIR}/_ext/580844646/lcd.o.d" -MT ${OBJECTDIR}/_ext/580844646/lcd.o -o ${OBJECTDIR}/_ext/580844646/lcd.o ../rev_lib/lcd.c 
	
${OBJECTDIR}/_ext/580844646/millis.o: ../rev_lib/millis.c  .generated_files/flags/default/fe935f681b7e7fd6b94aafb466dc305a2a83c070 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/millis.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/millis.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/millis.o.d" -MT "${OBJECTDIR}/_ext/580844646/millis.o.d" -MT ${OBJECTDIR}/_ext/580844646/millis.o -o ${OBJECTDIR}/_ext/580844646/millis.o ../rev_lib/millis.c 
	
${OBJECTDIR}/_ext/580844646/mpu6500.o: ../rev_lib/mpu6500.c  .generated_files/flags/default/1d3084177848943ae10b72279d2788a02a8ec0ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/mpu6500.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/mpu6500.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/mpu6500.o.d" -MT "${OBJECTDIR}/_ext/580844646/mpu6500.o.d" -MT ${OBJECTDIR}/_ext/580844646/mpu6500.o -o ${OBJECTDIR}/_ext/580844646/mpu6500.o ../rev_lib/mpu6500.c 
	
${OBJECTDIR}/_ext/580844646/uart.o: ../rev_lib/uart.c  .generated_files/flags/default/87ec3d209d6dff52f13b618b2e8ad78408b8025e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/uart.o.d" -MT "${OBJECTDIR}/_ext/580844646/uart.o.d" -MT ${OBJECTDIR}/_ext/580844646/uart.o -o ${OBJECTDIR}/_ext/580844646/uart.o ../rev_lib/uart.c 
	
${OBJECTDIR}/_ext/580844646/w25qxx.o: ../rev_lib/w25qxx.c  .generated_files/flags/default/5e9fb2201892bfc309c8450ea02b9f1746b025f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/w25qxx.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/w25qxx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/w25qxx.o.d" -MT "${OBJECTDIR}/_ext/580844646/w25qxx.o.d" -MT ${OBJECTDIR}/_ext/580844646/w25qxx.o -o ${OBJECTDIR}/_ext/580844646/w25qxx.o ../rev_lib/w25qxx.c 
	
${OBJECTDIR}/_ext/580844646/dac.o: ../rev_lib/dac.c  .generated_files/flags/default/916b51d301a8e75ea9daf3c584eeae5eb2c51b0f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/580844646" 
	@${RM} ${OBJECTDIR}/_ext/580844646/dac.o.d 
	@${RM} ${OBJECTDIR}/_ext/580844646/dac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/580844646/dac.o.d" -MT "${OBJECTDIR}/_ext/580844646/dac.o.d" -MT ${OBJECTDIR}/_ext/580844646/dac.o -o ${OBJECTDIR}/_ext/580844646/dac.o ../rev_lib/dac.c 
	
${OBJECTDIR}/main_filters.o: main_filters.c  .generated_files/flags/default/c4f8faf38323c748c87a8900087934aeb622ed94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_filters.o.d 
	@${RM} ${OBJECTDIR}/main_filters.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/main_filters.o.d" -MT "${OBJECTDIR}/main_filters.o.d" -MT ${OBJECTDIR}/main_filters.o -o ${OBJECTDIR}/main_filters.o main_filters.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/filters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/filters.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/filters.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/filters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/filters.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/filters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/filters.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../rev_lib" -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/filters.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/filters.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/filters.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/filters.X.${IMAGE_TYPE}.hex"
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
