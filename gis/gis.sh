#!/bin/bash

while getopts "n:s:w:e:p:" OPTION
do
     case $OPTION in
         n)
             n=$OPTARG
             ;;
         s)
             s=$OPTARG
             ;;
         w)
             w=$OPTARG
             ;;
         e)
             e=$OPTARG
             ;;
         p)
             ptp=$OPTARG
             ;;
     esac
done

wget -N http://data.openstreetmapdata.com/land-polygons-split-4326.zip
unzip -uo land-polygons-split-4326.zip  -d $PWD/

mkdir osm_coastline

#RU-LEN testing 26-58-36-62 ##################
if [ "$n" -gt 58 ];
then
	if [ "$s" -lt 62 ];
	then
		if [ "$w" -lt 36 ];
		then
			if [ "$e" -gt 26 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-LEN.7z
				7zr x -o* RU-LEN.7z
				sh merge.sh -o OUT -i RU-LEN
				rm -rf RU-LEN
			fi
		fi
	fi
fi
#RU-KR testing 29-60-38-67 ###################
if [ "$n" -gt 60 ];
then
	if [ "$s" -lt 67 ];
	then
		if [ "$w" -lt 38 ];
		then
			if [ "$e" -gt 29 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KR.7z
				7zr x -o* RU-KR.7z
				sh merge.sh -o OUT -i RU-KR
				rm -rf RU-KR
			fi
		fi
	fi
fi
#RU-SPE testing 29-61-31-59 ###################
if [ "$n" -gt 59 ];
then
	if [ "$s" -lt 61 ];
	then
		if [ "$w" -lt 31 ];
		then
			if [ "$e" -gt 29 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SPE.7z  #http://be.gis-lab.info/data/osmshp/latest/RU-SPE.7z
				7zr x -o* RU-SPE.7z
				sh merge.sh -o OUT -i RU-SPE
				rm -rf RU-SPE
			fi
		fi
	fi
fi
#RU-NGR testing 29-56-37-60 ###################
if [ "$n" -gt 56 ];
then
	if [ "$s" -lt 60 ];
	then
		if [ "$w" -lt 37 ];
		then
			if [ "$e" -gt 29 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-NGR.7z
				7zr x -o* RU-NGR.7z
				sh merge.sh -o OUT -i RU-NGR
				rm -rf RU-NGR
			fi
		fi
	fi
fi
#RU-PSK testing 27-55-32-60 ###################
if [ $n -gt 55 ];
then
	if [ $s -lt 60 ];
	then
		if [ $w -lt 32 ];
		then
			if [ $e -gt 27 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-PSK.7z
				7zr x -o* RU-PSK.7z
				sh merge.sh -o OUT -i RU-PSK
				rm -rf RU-PSK
			fi
		fi
	fi
fi
#RU-VLG testing 34-58-48-62 ###################
if [ "$n" -gt 58 ];
then
	if [ "$s" -lt 62 ];
	then
		if [ "$w" -lt 48 ];
		then
			if [ "$e" -gt 34 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-VLG.7z
				7zr x -o* RU-VLG.7z
				sh merge.sh -o OUT -i RU-VLG
				rm -rf RU-VLG
			fi
		fi
	fi
fi
#RU-KDA testing 36-43-42-48 ###################
if [ "$n" -gt 43 ];
then
	if [ "$s" -lt 48 ];
	then
		if [ "$w" -lt 42 ];
		then
			if [ "$e" -gt 36 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KDA.7z
				7zr x -o* RU-KDA.7z
				sh merge.sh -o OUT -i RU-KDA
				rm -rf RU-KDA
			fi
		fi
	fi
fi
#RU-AD testing 38-43-41-46 ###################
if [ "$n" -gt 43 ];
then
	if [ "$s" -lt 46 ];
	then
		if [ "$w" -lt 41 ];
		then
			if [ "$e" -gt 38 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-AD.7z
				7zr x -o* RU-AD.7z
				sh merge.sh -o OUT -i RU-AD
				rm -rf RU-AD
			fi
		fi
	fi
fi
#RU-AL testing 83-49-90-53 ###################
if [ "$n" -gt 49 ];
then
	if [ "$s" -lt 53 ];
	then
		if [ "$w" -lt 90 ];
		then
			if [ "$e" -gt 83 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-AL.7z
				7zr x -o* RU-AL.7z
				sh merge.sh -o OUT -i RU-AL
				rm -rf RU-AL
			fi
		fi
	fi
fi
#RU-ALT testing 77-50-88-55 ###################
if [ "$n" -gt 50 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 88 ];
		then
			if [ "$e" -gt 77 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ALT.7z
				7zr x -o* RU-ALT.7z
				sh merge.sh -o OUT -i RU-ALT
				rm -rf RU-ALT
			fi
		fi
	fi
fi
#RU-AMU testing 119-48-135-58 ###################
if [ "$n" -gt 48 ];
then
	if [ "$s" -lt 58 ];
	then
		if [ "$w" -lt 135 ];
		then
			if [ "$e" -gt 119 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-AMU.7z
				7zr x -o* RU-AMU.7z
				sh merge.sh -o OUT -i RU-AMU
				rm -rf RU-AMU
			fi
		fi
	fi
fi
#RU-ARK testing 35-60-70-83 ###################
if [ "$n" -gt 60 ];
then
	if [ "$s" -lt 83 ];
	then
		if [ "$w" -lt 70 ];
		then
			if [ "$e" -gt 35 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ARK.7z
				7zr x -o* RU-ARK.7z
				sh merge.sh -o OUT -i RU-ARK
				rm -rf RU-ARK
			fi
		fi
	fi
fi
#RU-AST testing 44-45-50-49 ###################
if [ "$n" -gt 45 ];
then
	if [ "$s" -lt 49 ];
	then
		if [ "$w" -lt 50 ];
		then
			if [ "$e" -gt 44 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-AST.7z
				7zr x -o* RU-AST.7z
				sh merge.sh -o OUT -i RU-AST
				rm -rf RU-AST
			fi
		fi
	fi
fi
#RU-BA testing 53-51-61-57 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 61 ];
		then
			if [ "$e" -gt 53 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-BA.7z
				7zr x -o* RU-BA.7z
				sh merge.sh -o OUT -i RU-BA
				rm -rf RU-BA
			fi
		fi
	fi
fi
#RU-BEL testing 35-49-40-52 ###################
if [ "$n" -gt 49 ];
then
	if [ "$s" -lt 52 ];
	then
		if [ "$w" -lt 40 ];
		then
			if [ "$e" -gt 35 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-BEL.7z
				7zr x -o* RU-BEL.7z
				sh merge.sh -o OUT -i RU-BEL
				rm -rf RU-BEL
			fi
		fi
	fi
fi
#RU-BRY testing 31-51-36-55 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 36 ];
		then
			if [ "$e" -gt 31 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-BRY.7z
				7zr x -o* RU-BRY.7z
				sh merge.sh -o OUT -i RU-BRY
				rm -rf RU-BRY
			fi
		fi
	fi
fi
#RU-BU testing 98-49-117-58 ###################
if [ "$n" -gt 49 ];
then
	if [ "$s" -lt 58 ];
	then
		if [ "$w" -lt 117 ];
		then
			if [ "$e" -gt 98 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-BU.7z
				7zr x -o* RU-BU.7z
				sh merge.sh -o OUT -i RU-BU
				rm -rf RU-BU
			fi
		fi
	fi
fi
#RU-CE testing 44-42-47-45 ###################
if [ "$n" -gt 42 ];
then
	if [ "$s" -lt 45 ];
	then
		if [ "$w" -lt 47 ];
		then
			if [ "$e" -gt 44 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-CE.7z
				7zr x -o* RU-CE.7z
				sh merge.sh -o OUT -i RU-CE
				rm -rf RU-CE
			fi
		fi
	fi
fi
#RU-CHE testing 57-51-64-57 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 64 ];
		then
			if [ "$e" -gt 57 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-CHE.7z
				7zr x -o* RU-CHE.7z
				sh merge.sh -o OUT -i RU-CHE
				rm -rf RU-CHE
			fi
		fi
	fi
fi
#RU-CHU testing 158-61-180-72 ###################
if [ "$n" -gt 61 ];
then
	if [ "$s" -lt 72 ];
	then
		if [ "$w" -lt 180 ];
		then
			if [ "$e" -gt 158 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-CHU.7z
				7zr x -o* RU-CHU.7z
				sh merge.sh -o OUT -i RU-CHU
				rm -rf RU-CHU
			fi
		fi
	fi
fi
#RU-CU testing 45-54-49-57 ###################
if [ "$n" -gt 54 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 49 ];
		then
			if [ "$e" -gt 45 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-CU.7z
				7zr x -o* RU-CU.7z
				sh merge.sh -o OUT -i RU-CU
				rm -rf RU-CU
			fi
		fi
	fi
fi
#RU-DA testing 45-41-49-45 ###################
if [ "$n" -gt 41 ];
then
	if [ "$s" -lt 45 ];
	then
		if [ "$w" -lt 49 ];
		then
			if [ "$e" -gt 45 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-DA.7z
				7zr x -o* RU-DA.7z
				sh merge.sh -o OUT -i RU-DA
				rm -rf RU-DA
			fi
		fi
	fi
fi
#RU-IN testing 44-42-46-44 ###################
if [ "$n" -gt 42 ];
then
	if [ "$s" -lt 44 ];
	then
		if [ "$w" -lt 46 ];
		then
			if [ "$e" -gt 44 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-IN.7z
				7zr x -o* RU-IN.7z
				sh merge.sh -o OUT -i RU-IN
				rm -rf RU-IN
			fi
		fi
	fi
fi
#RU-IRK testing 95-51-120-65 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 65 ];
	then
		if [ "$w" -lt 120 ];
		then
			if [ "$e" -gt 95 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-IRK.7z
				7zr x -o* RU-IRK.7z
				sh merge.sh -o OUT -i RU-IRK
				rm -rf RU-IRK
			fi
		fi
	fi
fi
#RU-IVA testing 39-56-44-58 ###################
if [ "$n" -gt 56 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 44 ];
		then
			if [ "$e" -gt 39 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-IVA.7z
				7zr x -o* RU-IVA.7z
				sh merge.sh -o OUT -i RU-IVA
				rm -rf RU-IVA
			fi
		fi
	fi
fi
#RU-KAM testing 155-50-175-65 ###################
if [ "$n" -gt 50 ];
then
	if [ "$s" -lt 65 ];
	then
		if [ "$w" -lt 175 ];
		then
			if [ "$e" -gt 155 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KAM.7z
				7zr x -o* RU-KAM.7z
				sh merge.sh -o OUT -i RU-KAM
				rm -rf RU-KAM
			fi
		fi
	fi
fi
#RU-KB testing 42-42-45-45 ###################
if [ "$n" -gt 42 ];
then
	if [ "$s" -lt 45 ];
	then
		if [ "$w" -lt 45 ];
		then
			if [ "$e" -gt 42 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KB.7z
				7zr x -o* RU-KB.7z
				sh merge.sh -o OUT -i RU-KB
				rm -rf RU-KB
			fi
		fi
	fi
fi
#RU-KC testing 40-43-43-45 ###################
if [ "$n" -gt 43 ];
then
	if [ "$s" -lt 45 ];
	then
		if [ "$w" -lt 43 ];
		then
			if [ "$e" -gt 40 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KC.7z
				7zr x -o* RU-KC.7z
				sh merge.sh -o OUT -i RU-KC
				rm -rf RU-KC
			fi
		fi
	fi
fi
#RU-KEM testing 84-52-90-57 ###################
if [ "$n" -gt 52 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 90 ];
		then
			if [ "$e" -gt 84 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KEM.7z
				7zr x -o* RU-KEM.7z
				sh merge.sh -o OUT -i RU-KEM
				rm -rf RU-KEM
			fi
		fi
	fi
fi
#RU-KGD testing 19-54-23-56 ###################
if [ "$n" -gt 54 ];
then
	if [ "$s" -lt 56 ];
	then
		if [ "$w" -lt 23 ];
		then
			if [ "$e" -gt 19 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KGD.7z
				7zr x -o* RU-KGD.7z
				sh merge.sh -o OUT -i RU-KGD
				rm -rf RU-KGD
			fi
		fi
	fi
fi
#RU-KGN testing 61-54-69-57 ###################
if [ "$n" -gt 54 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 69 ];
		then
			if [ "$e" -gt 61 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KGN.7z
				7zr x -o* RU-KGN.7z
				sh merge.sh -o OUT -i RU-KGN
				rm -rf RU-KGN
			fi
		fi
	fi
fi
#RU-KHA testing 130-46-148-63 ###################
if [ "$n" -gt 46 ];
then
	if [ "$s" -lt 63 ];
	then
		if [ "$w" -lt 148 ];
		then
			if [ "$e" -gt 130 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KHA.7z
				7zr x -o* RU-KHA.7z
				sh merge.sh -o OUT -i RU-KHA
				rm -rf RU-KHA
			fi
		fi
	fi
fi
#RU-KHM testing 59-58-86-66 ###################
if [ "$n" -gt 58 ];
then
	if [ "$s" -lt 66 ];
	then
		if [ "$w" -lt 86 ];
		then
			if [ "$e" -gt 59 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KHM.7z
				7zr x -o* RU-KHM.7z
				sh merge.sh -o OUT -i RU-KHM
				rm -rf RU-KHM
			fi
		fi
	fi
fi
#RU-KIR testing 46-56-54-62 ###################
if [ "$n" -gt 56 ];
then
	if [ "$s" -lt 62 ];
	then
		if [ "$w" -lt 54 ];
		then
			if [ "$e" -gt 46 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KIR.7z
				7zr x -o* RU-KIR.7z
				sh merge.sh -o OUT -i RU-KIR
				rm -rf RU-KIR
			fi
		fi
	fi
fi
#RU-KK testing 87-51-92-56 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 56 ];
	then
		if [ "$w" -lt 92 ];
		then
			if [ "$e" -gt 87 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KK.7z
				7zr x -o* RU-KK.7z
				sh merge.sh -o OUT -i RU-KK
				rm -rf RU-KK
			fi
		fi
	fi
fi
#RU-KL testing 41-44-48-49 ###################
if [ "$n" -gt 44 ];
then
	if [ "$s" -lt 49 ];
	then
		if [ "$w" -lt 48 ];
		then
			if [ "$e" -gt 41 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KL.7z
				7zr x -o* RU-KL.7z
				sh merge.sh -o OUT -i RU-KL
				rm -rf RU-KL
			fi
		fi
	fi
fi
#RU-KLU testing 33-53-38-56 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 56 ];
	then
		if [ "$w" -lt 38 ];
		then
			if [ "$e" -gt 33 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KLU.7z
				7zr x -o* RU-KLU.7z
				sh merge.sh -o OUT -i RU-KLU
				rm -rf RU-KLU
			fi
		fi
	fi
fi
#RU-KO testing 45-59-67-69 ###################
if [ "$n" -gt 59 ];
then
	if [ "$s" -lt 69 ];
	then
		if [ "$w" -lt 67 ];
		then
			if [ "$e" -gt 45 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KO.7z
				7zr x -o* RU-KO.7z
				sh merge.sh -o OUT -i RU-KO
				rm -rf RU-KO
			fi
		fi
	fi
fi
#RU-KOS testing 40-57-48-60 ###################
if [ "$n" -gt 57 ];
then
	if [ "$s" -lt 60 ];
	then
		if [ "$w" -lt 48 ];
		then
			if [ "$e" -gt 40 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KOS.7z
				7zr x -o* RU-KOS.7z
				sh merge.sh -o OUT -i RU-KOS
				rm -rf RU-KOS
			fi
		fi
	fi
fi
#RU-KRS testing 34-50-39-53 ###################
if [ "$n" -gt 50 ];
then
	if [ "$s" -lt 53 ];
	then
		if [ "$w" -lt 39 ];
		then
			if [ "$e" -gt 34 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KRS.7z
				7zr x -o* RU-KRS.7z
				sh merge.sh -o OUT -i RU-KRS
				rm -rf RU-KRS
			fi
		fi
	fi
fi
#RU-KYA testing 75-51-115-82 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 82 ];
	then
		if [ "$w" -lt 115 ];
		then
			if [ "$e" -gt 75 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-KYA.7z
				7zr x -o* RU-KYA.7z
				sh merge.sh -o OUT -i RU-KYA
				rm -rf RU-KYA
			fi
		fi
	fi
fi
#RU-LIP testing 37-51-41-54 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 54 ];
	then
		if [ "$w" -lt 41 ];
		then
			if [ "$e" -gt 37 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-LIP.7z
				7zr x -o* RU-LIP.7z
				sh merge.sh -o OUT -i RU-LIP
				rm -rf RU-LIP
			fi
		fi
	fi
fi
#RU-MAG testing 144-58-164-67 ###################
if [ "$n" -gt 58 ];
then
	if [ "$s" -lt 67 ];
	then
		if [ "$w" -lt 164 ];
		then
			if [ "$e" -gt 144 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-MAG.7z
				7zr x -o* RU-MAG.7z
				sh merge.sh -o OUT -i RU-MAG
				rm -rf RU-MAG
			fi
		fi
	fi
fi
#RU-ME testing 45-55-51-58 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 58 ];
	then
		if [ "$w" -lt 51 ];
		then
			if [ "$e" -gt 45 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ME.7z
				7zr x -o* RU-ME.7z
				sh merge.sh -o OUT -i RU-ME
				rm -rf RU-ME
			fi
		fi
	fi
fi
#RU-MO testing 42-53-47-56 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 56 ];
	then
		if [ "$w" -lt 47 ];
		then
			if [ "$e" -gt 42 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-MO.7z
				7zr x -o* RU-MO.7z
				sh merge.sh -o OUT -i RU-MO
				rm -rf RU-MO
			fi
		fi
	fi
fi
#RU-MOS testing 35-54-41-57 ###################
if [ "$n" -gt 54 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 41 ];
		then
			if [ "$e" -gt 35 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-MOS.7z
				7zr x -o* RU-MOS.7z
				sh merge.sh -o OUT -i RU-MOS
				rm -rf RU-MOS
			fi
		fi
	fi
fi
#RU-MOW testing 37-55-38-57 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 38 ];
		then
			if [ "$e" -gt 37 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-MOW.7z
				7zr x -o* RU-MOW.7z
				sh merge.sh -o OUT -i RU-MOW
				rm -rf RU-MOW
			fi
		fi
	fi
fi
#RU-MUR testing 28-65-43-71 ###################
if [ "$n" -gt 65 ];
then
	if [ "$s" -lt 71 ];
	then
		if [ "$w" -lt 43 ];
		then
			if [ "$e" -gt 28 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-MUR.7z
				7zr x -o* RU-MUR.7z
				sh merge.sh -o OUT -i RU-MUR
				rm -rf RU-MUR
			fi
		fi
	fi
fi
#RU-NEN testing 41-65-67-71 ###################
if [ "$n" -gt 65 ];
then
	if [ "$s" -lt 71 ];
	then
		if [ "$w" -lt 67 ];
		then
			if [ "$e" -gt 41 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-NEN.7z
				7zr x -o* RU-NEN.7z
				sh merge.sh -o OUT -i RU-NEN
				rm -rf RU-NEN
			fi
		fi
	fi
fi
#RU-NIZ testing 41-54-48-59 ###################
if [ "$n" -gt 54 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 48 ];
		then
			if [ "$e" -gt 41 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-NIZ.7z
				7zr x -o* RU-NIZ.7z
				sh merge.sh -o OUT -i RU-NIZ
				rm -rf RU-NIZ
			fi
		fi
	fi
fi
#RU-NVS testing 75-53-86-58 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 58 ];
	then
		if [ "$w" -lt 86 ];
		then
			if [ "$e" -gt 75 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-NVS.7z
				7zr x -o* RU-NVS.7z
				sh merge.sh -o OUT -i RU-NVS
				rm -rf RU-NVS
			fi
		fi
	fi
fi
#RU-OMS testing 70-53-77-59 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 77 ];
		then
			if [ "$e" -gt 70 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-OMS.7z
				7zr x -o* RU-OMS.7z
				sh merge.sh -o OUT -i RU-OMS
				rm -rf RU-OMS
			fi
		fi
	fi
fi
#RU-ORE testing 50-50-62-55 ###################
if [ "$n" -gt 50 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 62 ];
		then
			if [ "$e" -gt 50 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ORE.7z
				7zr x -o* RU-ORE.7z
				sh merge.sh -o OUT -i RU-ORE
				rm -rf RU-ORE
			fi
		fi
	fi
fi
#RU-ORL testing 34-51-39-54 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 54 ];
	then
		if [ "$w" -lt 39 ];
		then
			if [ "$e" -gt 34 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ORL.7z
				7zr x -o* RU-ORL.7z
				sh merge.sh -o OUT -i RU-ORL
				rm -rf RU-ORL
			fi
		fi
	fi
fi
#RU-PER testing 51-56-60-62 ###################
if [ "$n" -gt 56 ];
then
	if [ "$s" -lt 62 ];
	then
		if [ "$w" -lt 60 ];
		then
			if [ "$e" -gt 51 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-PER.7z
				7zr x -o* RU-PER.7z
				sh merge.sh -o OUT -i RU-PER
				rm -rf RU-PER
			fi
		fi
	fi
fi
#RU-PNZ testing 42-52-47-55 ###################
if [ "$n" -gt 52 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 47 ];
		then
			if [ "$e" -gt 42 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-PNZ.7z
				7zr x -o* RU-PNZ.7z
				sh merge.sh -o OUT -i RU-PNZ
				rm -rf RU-PNZ
			fi
		fi
	fi
fi
#RU-PRI testing 130-42-140-49 ###################
if [ "$n" -gt 42 ];
then
	if [ "$s" -lt 49 ];
	then
		if [ "$w" -lt 140 ];
		then
			if [ "$e" -gt 130 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-PRI.7z
				7zr x -o* RU-PRI.7z
				sh merge.sh -o OUT -i RU-PRI
				rm -rf RU-PRI
			fi
		fi
	fi
fi
#RU-ROS testing 38-45-45-51 ###################
if [ "$n" -gt 45 ];
then
	if [ "$s" -lt 51 ];
	then
		if [ "$w" -lt 45 ];
		then
			if [ "$e" -gt 38 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ROS.7z
				7zr x -o* RU-ROS.7z
				sh merge.sh -o OUT -i RU-ROS
				rm -rf RU-ROS
			fi
		fi
	fi
fi
#RU-RYA testing 38-53-43-56 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 56 ];
	then
		if [ "$w" -lt 43 ];
		then
			if [ "$e" -gt 38 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-RYA.7z
				7zr x -o* RU-RYA.7z
				sh merge.sh -o OUT -i RU-RYA
				rm -rf RU-RYA
			fi
		fi
	fi
fi
#RU-SA testing 105-55-164-77 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 77 ];
	then
		if [ "$w" -lt 164 ];
		then
			if [ "$e" -gt 105 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SA.7z
				7zr x -o* RU-SA.7z
				sh merge.sh -o OUT -i RU-SA
				rm -rf RU-SA
			fi
		fi
	fi
fi
#RU-SAK testing 141-43-157-55 ###################
if [ "$n" -gt 43 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 157 ];
		then
			if [ "$e" -gt 141 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SAK.7z
				7zr x -o* RU-SAK.7z
				sh merge.sh -o OUT -i RU-SAK
				rm -rf RU-SAK
			fi
		fi
	fi
fi
#RU-SAM testing 47-51-53-55 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 53 ];
		then
			if [ "$e" -gt 47 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SAM.7z
				7zr x -o* RU-SAM.7z
				sh merge.sh -o OUT -i RU-SAM
				rm -rf RU-SAM
			fi
		fi
	fi
fi
#RU-SAR testing 42-49-51-53 ###################
if [ "$n" -gt 49 ];
then
	if [ "$s" -lt 53 ];
	then
		if [ "$w" -lt 51 ];
		then
			if [ "$e" -gt 42 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SAR.7z
				7zr x -o* RU-SAR.7z
				sh merge.sh -o OUT -i RU-SAR
				rm -rf RU-SAR
			fi
		fi
	fi
fi
#RU-SE testing 43-42-45-44 ###################
if [ "$n" -gt 42 ];
then
	if [ "$s" -lt 44 ];
	then
		if [ "$w" -lt 45 ];
		then
			if [ "$e" -gt 43 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SE.7z
				7zr x -o* RU-SE.7z
				sh merge.sh -o OUT -i RU-SE
				rm -rf RU-SE
			fi
		fi
	fi
fi
#RU-SMO testing 30-53-36-57 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 36 ];
		then
			if [ "$e" -gt 30 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SMO.7z
				7zr x -o* RU-SMO.7z
				sh merge.sh -o OUT -i RU-SMO
				rm -rf RU-SMO
			fi
		fi
	fi
fi
#RU-STA testing 40-43-46-47 ###################
if [ "$n" -gt 43 ];
then
	if [ "$s" -lt 47 ];
	then
		if [ "$w" -lt 46 ];
		then
			if [ "$e" -gt 40 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-STA.7z
				7zr x -o* RU-STA.7z
				sh merge.sh -o OUT -i RU-STA
				rm -rf RU-STA
			fi
		fi
	fi
fi
#RU-SVE testing 57-56-67-62 ###################
if [ "$n" -gt 56 ];
then
	if [ "$s" -lt 62 ];
	then
		if [ "$w" -lt 67 ];
		then
			if [ "$e" -gt 57 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-SVE.7z
				7zr x -o* RU-SVE.7z
				sh merge.sh -o OUT -i RU-SVE
				rm -rf RU-SVE
			fi
		fi
	fi
fi
#RU-TA testing 47-53-55-57 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 55 ];
		then
			if [ "$e" -gt 47 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-TA.7z
				7zr x -o* RU-TA.7z
				sh merge.sh -o OUT -i RU-TA
				rm -rf RU-TA
			fi
		fi
	fi
fi
#RU-TAM testing 39-51-44-54 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 54 ];
	then
		if [ "$w" -lt 44 ];
		then
			if [ "$e" -gt 39 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-TAM.7z
				7zr x -o* RU-TAM.7z
				sh merge.sh -o OUT -i RU-TAM
				rm -rf RU-TAM
			fi
		fi
	fi
fi
#RU-TOM testing 75-55-90-62 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 62 ];
	then
		if [ "$w" -lt 90 ];
		then
			if [ "$e" -gt 75 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-TOM.7z
				7zr x -o* RU-TOM.7z
				sh merge.sh -o OUT -i RU-TOM
				rm -rf RU-TOM
			fi
		fi
	fi
fi
#RU-TUL testing 35-52-39-55 ###################
if [ "$n" -gt 52 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 39 ];
		then
			if [ "$e" -gt 35 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-TUL.7z
				7zr x -o* RU-TUL.7z
				sh merge.sh -o OUT -i RU-TUL
				rm -rf RU-TUL
			fi
		fi
	fi
fi
#RU-TVE testing 30-55-39-59 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 39 ];
		then
			if [ "$e" -gt 30 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-TVE.7z
				7zr x -o* RU-TVE.7z
				sh merge.sh -o OUT -i RU-TVE
				rm -rf RU-TVE
			fi
		fi
	fi
fi
#RU-TY testing 88-49-100-54 ###################
if [ "$n" -gt 49 ];
then
	if [ "$s" -lt 54 ];
	then
		if [ "$w" -lt 100 ];
		then
			if [ "$e" -gt 88 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-TY.7z
				7zr x -o* RU-TY.7z
				sh merge.sh -o OUT -i RU-TY
				rm -rf RU-TY
			fi
		fi
	fi
fi
#RU-TYU testing 64-55-76-60 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 60 ];
	then
		if [ "$w" -lt 76 ];
		then
			if [ "$e" -gt 64 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-TYU.7z
				7zr x -o* RU-TYU.7z
				sh merge.sh -o OUT -i RU-TYU
				rm -rf RU-TYU
			fi
		fi
	fi
fi
#RU-UD testing 51-55-55-59 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 55 ];
		then
			if [ "$e" -gt 51 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-UD.7z
				7zr x -o* RU-UD.7z
				sh merge.sh -o OUT -i RU-UD
				rm -rf RU-UD
			fi
		fi
	fi
fi
#RU-ULY testing 45-52-51-55 ###################
if [ "$n" -gt 52 ];
then
	if [ "$s" -lt 55 ];
	then
		if [ "$w" -lt 51 ];
		then
			if [ "$e" -gt 45 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ULY.7z
				7zr x -o* RU-ULY.7z
				sh merge.sh -o OUT -i RU-ULY
				rm -rf RU-ULY
			fi
		fi
	fi
fi
#RU-VGG testing 41-47-48-52 ###################
if [ "$n" -gt 47 ];
then
	if [ "$s" -lt 52 ];
	then
		if [ "$w" -lt 48 ];
		then
			if [ "$e" -gt 41 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-VGG.7z
				7zr x -o* RU-VGG.7z
				sh merge.sh -o OUT -i RU-VGG
				rm -rf RU-VGG
			fi
		fi
	fi
fi
#RU-VLA testing 38-55-43-57 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 43 ];
		then
			if [ "$e" -gt 38 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-VLA.7z
				7zr x -o* RU-VLA.7z
				sh merge.sh -o OUT -i RU-VLA
				rm -rf RU-VLA
			fi
		fi
	fi
fi
#RU-VOR testing 38-49-43-53 ###################
if [ "$n" -gt 49 ];
then
	if [ "$s" -lt 53 ];
	then
		if [ "$w" -lt 43 ];
		then
			if [ "$e" -gt 38 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-VOR.7z
				7zr x -o* RU-VOR.7z
				sh merge.sh -o OUT -i RU-VOR
				rm -rf RU-VOR
			fi
		fi
	fi
fi
#RU-YAN testing 62-62-87-74 ###################
if [ "$n" -gt 62 ];
then
	if [ "$s" -lt 74 ];
	then
		if [ "$w" -lt 87 ];
		then
			if [ "$e" -gt 62 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-YAN.7z
				7zr x -o* RU-YAN.7z
				sh merge.sh -o OUT -i RU-YAN
				rm -rf RU-YAN
			fi
		fi
	fi
fi
#RU-YAR testing 37-56-42-59 ###################
if [ "$n" -gt 56 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 42 ];
		then
			if [ "$e" -gt 37 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-YAR.7z
				7zr x -o* RU-YAR.7z
				sh merge.sh -o OUT -i RU-YAR
				rm -rf RU-YAR
			fi
		fi
	fi
fi
#RU-YEV testing 130-47-135-50 ###################
if [ "$n" -gt 47 ];
then
	if [ "$s" -lt 50 ];
	then
		if [ "$w" -lt 135 ];
		then
			if [ "$e" -gt 130 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-YEV.7z
				7zr x -o* RU-YEV.7z
				sh merge.sh -o OUT -i RU-YEV
				rm -rf RU-YEV
			fi
		fi
	fi
fi
#RU-ZAB testing 107-49-123-59 ###################
if [ "$n" -gt 49 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 123 ];
		then
			if [ "$e" -gt 107 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/RU-ZAB.7z
				7zr x -o* RU-ZAB.7z
				sh merge.sh -o OUT -i RU-ZAB
				rm -rf RU-ZAB
			fi
		fi
	fi
fi
#AM testing 43-38-47-42 ###################
if [ "$n" -gt 38 ];
then
	if [ "$s" -lt 42 ];
	then
		if [ "$w" -lt 47 ];
		then
			if [ "$e" -gt 43 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/AM.7z
				7zr x -o* AM.7z
				sh merge.sh -o OUT -i AM
				rm -rf AM
			fi
		fi
	fi
fi
#AZ testing 44-38-50-42 ###################
if [ "$n" -gt 38 ];
then
	if [ "$s" -lt 42 ];
	then
		if [ "$w" -lt 50 ];
		then
			if [ "$e" -gt 44 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/AZ.7z
				7zr x -o* AZ.7z
				sh merge.sh -o OUT -i AZ
				rm -rf AZ
			fi
		fi
	fi
fi
#BY testing 23-51-33-57 ###################
if [ "$n" -gt 51 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 33 ];
		then
			if [ "$e" -gt 23 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/BY.7z
				7zr x -o* BY.7z
				sh merge.sh -o OUT -i BY
				rm -rf BY
			fi
		fi
	fi
fi
#EE testing 21-57-29-60 ###################
if [ "$n" -gt 57 ];
then
	if [ "$s" -lt 60 ];
	then
		if [ "$w" -lt 29 ];
		then
			if [ "$e" -gt 21 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/EE.7z
				7zr x -o* EE.7z
				sh merge.sh -o OUT -i EE
				rm -rf EE
			fi
		fi
	fi
fi
#GE testing 39-41-47-44 ###################
if [ "$n" -gt 41 ];
then
	if [ "$s" -lt 44 ];
	then
		if [ "$w" -lt 47 ];
		then
			if [ "$e" -gt 39 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/GE.7z
				7zr x -o* GE.7z
				sh merge.sh -o OUT -i GE
				rm -rf GE
			fi
		fi
	fi
fi
#KG testing 69-39-81-44 ###################
if [ "$n" -gt 39 ];
then
	if [ "$s" -lt 44 ];
	then
		if [ "$w" -lt 81 ];
		then
			if [ "$e" -gt 69 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/KG.7z
				7zr x -o* KG.7z
				sh merge.sh -o OUT -i KG
				rm -rf KG
			fi
		fi
	fi
fi
#KZ testing 46-40-88-56 ###################
if [ "$n" -gt 40 ];
then
	if [ "$s" -lt 56 ];
	then
		if [ "$w" -lt 88 ];
		then
			if [ "$e" -gt 46 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/KZ.7z
				7zr x -o* KZ.7z
				sh merge.sh -o OUT -i KZ
				rm -rf KZ
			fi
		fi
	fi
fi
#LT testing 20-53-27-57 ###################
if [ "$n" -gt 53 ];
then
	if [ "$s" -lt 57 ];
	then
		if [ "$w" -lt 27 ];
		then
			if [ "$e" -gt 20 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/LT.7z
				7zr x -o* LT.7z
				sh merge.sh -o OUT -i LT
				rm -rf LT
			fi
		fi
	fi
fi
#LV testing 20-55-29-59 ###################
if [ "$n" -gt 55 ];
then
	if [ "$s" -lt 59 ];
	then
		if [ "$w" -lt 29 ];
		then
			if [ "$e" -gt 20 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/LV.7z
				7zr x -o* LV.7z
				sh merge.sh -o OUT -i LV
				rm -rf LV
			fi
		fi
	fi
fi
#MD testing 26-45-31-49 ###################
if [ "$n" -gt 45 ];
then
	if [ "$s" -lt 49 ];
	then
		if [ "$w" -lt 31 ];
		then
			if [ "$e" -gt 26 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/MD.7z
				7zr x -o* MD.7z
				sh merge.sh -o OUT -i MD
				rm -rf MD
			fi
		fi
	fi
fi
#TJ testing 67-36-76-42 ###################
if [ "$n" -gt 36 ];
then
	if [ "$s" -lt 42 ];
	then
		if [ "$w" -lt 76 ];
		then
			if [ "$e" -gt 67 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/TJ.7z
				7zr x -o* TJ.7z
				sh merge.sh -o OUT -i TJ
				rm -rf TJ
			fi
		fi
	fi
fi
#TM testing 52-35-67-43 ###################
if [ "$n" -gt 35 ];
then
	if [ "$s" -lt 43 ];
	then
		if [ "$w" -lt 67 ];
		then
			if [ "$e" -gt 52 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/TM.7z
				7zr x -o* TM.7z
				sh merge.sh -o OUT -i TM
				rm -rf TM
			fi
		fi
	fi
fi
#UA testing 22-44-41-53 ###################
if [ "$n" -gt 44 ];
then
	if [ "$s" -lt 53 ];
	then
		if [ "$w" -lt 41 ];
		then
			if [ "$e" -gt 22 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/UA.7z
				7zr x -o* UA.7z
				sh merge.sh -o OUT -i UA
				rm -rf UA
			fi
		fi
	fi
fi
#UZ testing 55-37-74-46 ###################
if [ "$n" -gt 37 ];
then
	if [ "$s" -lt 46 ];
	then
		if [ "$w" -lt 74 ];
		then
			if [ "$e" -gt 55 ];
			then
				wget -N http://be.gis-lab.info/data/osmshp/latest/UZ.7z
				7zr x -o* UZ.7z
				sh merge.sh -o OUT -i UZ
				rm -rf UZ
			fi
		fi
	fi
fi

sh cut.sh -n $n -s $s -w $w -e $e -d OUT 
#bash landcut.sh -n $n -s $s -w $w -e $e
rm -rf land-polygons-split-4326

mkdir osm_motorway
mkdir osm_motorway_link
mkdir osm_trunk
mkdir osm_primary
mkdir osm_secondary
mkdir osm_tertiary
mkdir osm_unclassified
mkdir osm_residential
mkdir osm_service
mkdir osm_raceway
mkdir osm_water_poly
mkdir osm_marsh
mkdir osm_heath
mkdir osm_scrub
mkdir osm_urban
mkdir osm_forest_c
mkdir osm_forest_d
mkdir osm_forest_m
mkdir osm_water_river
mkdir osm_water_canal
mkdir osm_water_stream
mkdir osm_railway
mkdir osm_railway_siding
mkdir osm_railway_spur
mkdir osm_tram
mkdir osm_industrial
mkdir osm_meadow
mkdir osm_farm
mkdir osm_parking
mkdir osm_sand
mkdir osm_grass
mkdir osm_unpaved_roads

#-nlt "LINESTRING" -lco ENCODING=UTF-8

ogr2ogr -skipfailures -simplify 0.0001 -where "TUNNEL!='yes'" $PWD/OUT/highway_non_tunnel.shp $PWD/OUT/highway-line-cut.shp

#ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='NULL' AND SURFACE='wood' OR SURAFCE='unpaved' OR SURFACE='sawdust' OR SURFACE='sand' OR SURFACE='pebblestone' OR SURFACE='ground_dirt' OR SURFACE='ground' OR SURFACE='gravel' OR SURFACE='grass' OR SURFACE='fine_gravel' OR SURFACE='earth' OR SURFACE='dirt' OR SURFACE='compacted'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='wood'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='unpaved'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='sawdust'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='sand'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='pebblestone'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='ground_dirt'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='ground'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='gravel'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='grass'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='fine_gravel'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='earth'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='dirt'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -update -append -where "SURFACE='compacted'" $PWD/osm_unpaved_roads/highway_unpaved.shp $PWD/OUT/highway_non_tunnel.shp

rm $PWD/OUT/highway-line-cut.*
#ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='wood' AND SURAFCE!='unpaved' AND SURFACE!='sawdust' AND SURFACE!='sand' AND SURFACE!='pebblestone' AND SURFACE!='ground_dirt' AND SURFACE!='ground' AND SURFACE!='gravel' AND SURFACE!='grass' AND SURFACE!='fine_gravel' AND SURFACE!='earth' AND SURFACE!='dirt' AND SURFACE!='compacted'" $PWD/OUT/highway-line-cut.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='wood'" $PWD/OUT/highway-filter-01.shp $PWD/OUT/highway_non_tunnel.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='unpaved'" $PWD/OUT/highway-filter-02.shp $PWD/OUT/highway-filter-01.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='sawdust'" $PWD/OUT/highway-filter-03.shp $PWD/OUT/highway-filter-02.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='sand'" $PWD/OUT/highway-filter-04.shp $PWD/OUT/highway-filter-03.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='pebblestone'" $PWD/OUT/highway-filter-05.shp $PWD/OUT/highway-filter-04.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='ground_dirt'" $PWD/OUT/highway-filter-06.shp $PWD/OUT/highway-filter-05.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='ground'" $PWD/OUT/highway-filter-07.shp $PWD/OUT/highway-filter-06.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='gravel'" $PWD/OUT/highway-filter-08.shp $PWD/OUT/highway-filter-07.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='grass'" $PWD/OUT/highway-filter-09.shp $PWD/OUT/highway-filter-08.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='fine_gravel'" $PWD/OUT/highway-filter-10.shp $PWD/OUT/highway-filter-09.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='earth'" $PWD/OUT/highway-filter-11.shp $PWD/OUT/highway-filter-10.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='dirt'" $PWD/OUT/highway-filter-12.shp $PWD/OUT/highway-filter-11.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "SURFACE!='compacted'" $PWD/OUT/highway-line-cut.shp $PWD/OUT/highway-filter-12.shp


ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='motorway'" $PWD/osm_motorway/mosm_motorway.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='motorway_link' OR HIGHWAY='primary_link' OR HIGHWAY='secondary_link' OR HIGHWAY='tertiary_link' OR HIGHWAY='trunk_link'" $PWD/osm_motorway_link/mosm_links.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='trunk'" $PWD/osm_trunk/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='primary'" $PWD/osm_primary/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='secondary'" $PWD/osm_secondary/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='tertiary'" $PWD/osm_tertiary/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='service'" $PWD/osm_service/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='unclassified'" $PWD/osm_unclassified/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='residential'" $PWD/osm_residential/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "HIGHWAY='raceway'" $PWD/osm_raceway/mosm_road.shp $PWD/OUT/highway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "NATURAL='water' OR WATERWAY='riverbank'" $PWD/osm_water_poly/mosm_water.shp $PWD/OUT/water-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "WETLAND='bog' OR WETLAND='marsh' or WETLAND='swamp'" $PWD/osm_marsh/mosm_marsh.shp $PWD/OUT/water-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "NATURAL='heath'" $PWD/osm_heath/mosm_heath.shp $PWD/OUT/vegetation-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "NATURAL='scrub'" $PWD/osm_scrub/mosm_scrub.shp $PWD/OUT/vegetation-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "LANDUSE='allotments' OR LANDUSE='residential'" $PWD/osm_urban/mosm_urban.shp $PWD/OUT/landuse-polygon-cut.shp
#ogr2ogr -skipfailures $PWD/osm_forest/mosm_forest.shp $PWD/OUT/vegetation-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "NATURAL LIKE '%wood%' OR LANDUSE LIKE '%forest%'" $PWD/OUT/forest-cut.shp $PWD/OUT/vegetation-polygon-cut.shp
ogr2ogr -skipfailures -where "WOOD LIKE '%coniferous%'" $PWD/osm_forest_c/mosm_forest.shp $PWD/OUT/forest-cut.shp
ogr2ogr -skipfailures -where "WOOD LIKE '%deciduous%'" $PWD/osm_forest_d/mosm_forest.shp $PWD/OUT/forest-cut.shp
ogr2ogr -skipfailures -where "WOOD NOT LIKE '%deciduous%' AND WOOD NOT LIKE '%coniferous%'" $PWD/osm_forest_m/mosm_forest.shp $PWD/OUT/forest-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "NATURAL='beach' or NATURAL='sand'" $PWD/osm_sand/mosm_sand.shp $PWD/OUT/surface-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "WATERWAY='river'" $PWD/osm_water_river/mosm_river.shp $PWD/OUT/water-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "WATERWAY='canal'" $PWD/osm_water_canal/mosm_canal.shp $PWD/OUT/water-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "WATERWAY='stream'" $PWD/osm_water_stream/mosm_stream.shp $PWD/OUT/water-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "TUNNEL!='yes' AND RAILWAY='rail'" $PWD/osm_railway/mosm_rail.shp $PWD/OUT/railway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "TUNNEL!='yes' AND RAILWAY='siding'" $PWD/osm_railway_siding/mosm_rail.shp $PWD/OUT/railway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "TUNNEL!='yes' AND RAILWAY='spur'" $PWD/osm_railway_spur/mosm_rail.shp $PWD/OUT/railway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "TUNNEL!='yes' AND RAILWAY='tram'" $PWD/osm_tram/mosm_rail.shp $PWD/OUT/railway-line-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "LANDUSE='industrial'" $PWD/osm_industrial/mosm_industrial.shp $PWD/OUT/landuse-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "LANDUSE='meadow'" $PWD/osm_meadow/mosm_meadow.shp $PWD/OUT/landuse-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "LANDUSE='farm' OR LANDUSE='farmland' OR LANDUSE='farmyard'" $PWD/osm_farm/mosm_farm.shp $PWD/OUT/landuse-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "LANDUSE='grass' OR LANDUSE='grassland' OR LANDUSE='greenfield'" $PWD/osm_grass/mosm_grass.shp $PWD/OUT/landuse-polygon-cut.shp
ogr2ogr -skipfailures -simplify 0.0001 -where "AMENITY='parking'" $PWD/osm_parking/mosm_parking.shp $PWD/OUT/poi-polygon-cut.shp

ogr2ogr -a_srs "EPSG:4326" $PWD/osm_coastline/land_polygons-cut_WGS84.shp  $PWD/osm_coastline/land_polygons-cut.shp

rm -rf $PWD/osm_coastline/land_polygons-cut.*

rm -rf OUT

rm -rf $ptp/data/shapefiles/osm_coastline
rm -rf $ptp/data/shapefiles/osm_motorway
rm -rf $ptp/data/shapefiles/osm_motorway_link
rm -rf $ptp/data/shapefiles/osm_trunk
rm -rf $ptp/data/shapefiles/osm_primary
rm -rf $ptp/data/shapefiles/osm_secondary
rm -rf $ptp/data/shapefiles/osm_tertiary
rm -rf $ptp/data/shapefiles/osm_unclassified
rm -rf $ptp/data/shapefiles/osm_residential
rm -rf $ptp/data/shapefiles/osm_service
rm -rf $ptp/data/shapefiles/osm_raceway
rm -rf $ptp/data/shapefiles/osm_water_poly
rm -rf $ptp/data/shapefiles/osm_marsh
rm -rf $ptp/data/shapefiles/osm_heath
rm -rf $ptp/data/shapefiles/osm_scrub
rm -rf $ptp/data/shapefiles/osm_urban
rm -rf $ptp/data/shapefiles/osm_forest_c
rm -rf $ptp/data/shapefiles/osm_forest_d
rm -rf $ptp/data/shapefiles/osm_forest_m
rm -rf $ptp/data/shapefiles/osm_water_river
rm -rf $ptp/data/shapefiles/osm_water_canal
rm -rf $ptp/data/shapefiles/osm_water_stream
rm -rf $ptp/data/shapefiles/osm_railway
rm -rf $ptp/data/shapefiles/osm_railway_siding
rm -rf $ptp/data/shapefiles/osm_railway_spur
rm -rf $ptp/data/shapefiles/osm_tram
rm -rf $ptp/data/shapefiles/osm_industrial
rm -rf $ptp/data/shapefiles/osm_meadow
rm -rf $ptp/data/shapefiles/osm_farm
rm -rf $ptp/data/shapefiles/osm_parking
rm -rf $ptp/data/shapefiles/osm_sand
rm -rf $ptp/data/shapefiles/osm_grass
rm -rf $ptp/data/shapefiles/osm_unpaved_roads

mv $PWD/osm_coastline $ptp/data/shapefiles/
mv $PWD/osm_motorway $ptp/data/shapefiles/
mv $PWD/osm_motorway_link $ptp/data/shapefiles/
mv $PWD/osm_trunk $ptp/data/shapefiles/
mv $PWD/osm_primary $ptp/data/shapefiles/
mv $PWD/osm_secondary $ptp/data/shapefiles/
mv $PWD/osm_tertiary $ptp/data/shapefiles/
mv $PWD/osm_unclassified $ptp/data/shapefiles/
mv $PWD/osm_residential $ptp/data/shapefiles/
mv $PWD/osm_service $ptp/data/shapefiles/
mv $PWD/osm_raceway $ptp/data/shapefiles/
mv $PWD/osm_water_poly $ptp/data/shapefiles/
mv $PWD/osm_marsh $ptp/data/shapefiles/
mv $PWD/osm_heath $ptp/data/shapefiles/
mv $PWD/osm_scrub $ptp/data/shapefiles/
mv $PWD/osm_urban $ptp/data/shapefiles/
mv $PWD/osm_forest_c $ptp/data/shapefiles/
mv $PWD/osm_forest_d $ptp/data/shapefiles/
mv $PWD/osm_forest_m $ptp/data/shapefiles/
mv $PWD/osm_water_river $ptp/data/shapefiles/
mv $PWD/osm_water_canal $ptp/data/shapefiles/
mv $PWD/osm_water_stream $ptp/data/shapefiles/
mv $PWD/osm_railway $ptp/data/shapefiles/
mv $PWD/osm_railway_siding $ptp/data/shapefiles/
mv $PWD/osm_railway_spur $ptp/data/shapefiles/
mv $PWD/osm_tram $ptp/data/shapefiles/
mv $PWD/osm_industrial $ptp/data/shapefiles/
mv $PWD/osm_meadow $ptp/data/shapefiles/
mv $PWD/osm_farm $ptp/data/shapefiles/
mv $PWD/osm_parking $ptp/data/shapefiles/
mv $PWD/osm_sand $ptp/data/shapefiles/
mv $PWD/osm_grass $ptp/data/shapefiles/
mv $PWD/osm_unpaved_roads $ptp/data/shapefiles/
