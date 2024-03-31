#!/bin/bash

# Paths to the conversion tools
BWTW_TOOL="../Packages/bigWigToWig"
BBTB_TOOL="../Packages/bigBedToBed"

dataDir="/data/user/vlaufer/T2T/RawData/hoffmanMappability"

# Convert BigWig files to Wig
for file in ${dataDir}/*.bw; do
    jobScript="convert_${file##*/}.sh"
    cat > ${jobScript} << EOF
#!/bin/bash
#SBATCH --job-name=convertBW2Wig
#SBATCH --output=convertBW2Wig_%j.out
#SBATCH --time=01:00:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=1

${BWTW_TOOL} "$file" "${file%.bw}.wig"
EOF
    sbatch ${jobScript}
done


# Convert BigBed files to Bed
for file in ${dataDir}/*.bb; do
    jobScript="convert_${file##*/}.sh"
    cat > ${jobScript} << EOF
#!/bin/bash
#SBATCH --job-name=convertBB2Bed
#SBATCH --output=convertBB2Bed_%j.out
#SBATCH --time=01:00:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=1

${BBTB_TOOL} "$file" "${file%.bb}.bed"
EOF
    sbatch ${jobScript}
done

