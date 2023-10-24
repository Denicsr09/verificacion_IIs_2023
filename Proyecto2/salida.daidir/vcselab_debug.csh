#!/bin/csh -f

cd /mnt/vol_NFS_rh003/Est_Verif_II2023/DenisseSolorzano_II_2023/verificacion_IIs_2023/Proyecto2

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/mnt/vol_NFS_rh003/tools/vcs/R-2020.12-SP2/linux64/bin/vcselab $* \
    -o \
    salida \
    -nobanner \

cd -

