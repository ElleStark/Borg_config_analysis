setwd("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work")
rm(list=ls())
options(scipen = 999)

Archive = "C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\RampingRun_03-2-22_10kFE\\Archive.txt"

Archive_matrix=read.csv(Archive, header = F, sep = "")

#################################
## Lake Mead Policy Variables ##
###############################

# Mead Surplus Distances #

d1 = Archive_matrix[,1]
d2 = Archive_matrix[,2]

d =rbind(d1,d2)
d = as.data.frame(d)

# Mead Shortage Elevations #

e1 = Archive_matrix[,3]
e2 = Archive_matrix[,4]
e3 = Archive_matrix[,5]
e4 = Archive_matrix[,6]
e5 = Archive_matrix[,7]
e6 = Archive_matrix[,8]
e7 = Archive_matrix[,9]
e8 = Archive_matrix[,10]

e = rbind(e1,e2,e3,e4,e5,e6,e7,e8)
# e = rbind(e8,e7,e6,e5,e4,e3,e2,e1)
e = as.data.frame(e)

# Mead Shortage Volumes # 

V1 = Archive_matrix[,11]
V2 = Archive_matrix[,12]
V3 = Archive_matrix[,13]
V4 = Archive_matrix[,14]
V5 = Archive_matrix[,15]
V6 = Archive_matrix[,16]
V7 = Archive_matrix[,17]
V8 = Archive_matrix[,18]

V = rbind(V1,V2,V3,V4,V5,V6,V7,V8)
V = as.data.frame(V)

###################################
## Lake Powell Policy Variables ##
#################################

# Powell Tier Elevations #

PT1e = Archive_matrix[,19]
PT2e = Archive_matrix[,20]
PT3e = Archive_matrix[,21]
PT4e = Archive_matrix[,22]
PT5e = Archive_matrix[,23]

PTe = rbind(PT1e,PT2e,PT3e,PT4e,PT5e)

# Powell Mead Reference Volume #

MeadRef1 = Archive_matrix[,24]
MeadRef2 = Archive_matrix[,25]
MeadRef3 = Archive_matrix[,26]
MeadRef4 = Archive_matrix[,27]
MeadRef5 = Archive_matrix[,28]

MeadRef = rbind(MeadRef1, MeadRef2, MeadRef3,MeadRef4,MeadRef5)

# Powell Tier Release Volume Range #

RelRange1 = Archive_matrix[,29]
RelRange2 = Archive_matrix[,30]
RelRange3 = Archive_matrix[,31]
RelRange4 = Archive_matrix[,32]
RelRange5 = Archive_matrix[,33]

RelRange = rbind(RelRange1, RelRange2, RelRange3,RelRange4,RelRange5)

# Powell Tier Balance Variable #

BalVar1 = Archive_matrix[,34]
BalVar2 = Archive_matrix[,35]
BalVar3 = Archive_matrix[,36]
BalVar4 = Archive_matrix[,37]
BalVar5 = Archive_matrix[,38]

BalVar = rbind(BalVar1, BalVar2, BalVar3, BalVar4, BalVar5)

# Powell Tier Releases # 

PT1Rel = Archive_matrix[,39]
PT2Rel = Archive_matrix[,40]
PT3Rel = Archive_matrix[,41]
PT4Rel = Archive_matrix[,42]
PT5Rel = Archive_matrix[,43]

PTRel = rbind(PT1Rel,PT2Rel,PT3Rel,PT4Rel,PT5Rel)

# Powell Equalization Line Increment #

EqInc = Archive_matrix[,44]

EqInc = rbind(EqInc)

# DV = rbind(d1,d2,e1,e2,e3,e4,e5,e6,e7,e8,V1,V2,V3,V4,V5,V6,V7,V8)
# DV = as.data.frame(DV)

#Creating 1 to number of policies within the archive's sub directories

parent.dir = "C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331"

Length = as.numeric(dim.data.frame(EqInc)[2])
folders = 1:Length
names=paste0("policy", 1:Length)

## Trace = Solution... used this so that it can be used as a trace based DMI

for(i in 1:length(folders)) {
  dir.create(paste(parent.dir,names[i],sep="/"))
}

#Appending Solution's DVs to their associated folders
i=1
# wd = paste(parent.dir)

for(i in 1:length(folders)) {
  ### d ###
  filepath_d=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Mead_Surplus_DV.txt", sep = "")
  write.table(d[,i],file = filepath_d, sep = " ", col.names = F, row.names = F)
  ### e ###
  filepath_e=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Mead_Shortage_e_DV.txt", sep = "")
  write.table(e[,i],file = filepath_e, sep = " ", col.names = F, row.names = F)
  ### V ###
  filepath_V=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Mead_Shortage_V_DV.txt", sep = "")
  write.table(V[,i],file = filepath_V, sep = " ", col.names = F, row.names = F)
  # Powell Tier Elevations #
  filepath_PTe=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Powell_Tier_Elevation_DV.txt", sep = "")
  write.table(PTe[,i],file = filepath_PTe, sep = " ", col.names = F, row.names = F)
  # Powell Tier Releases #
  filepath_PTR=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Powell_Primary_Release_Volume_DV.txt", sep = "")
  write.table(PTRel[,i],file = filepath_PTR, sep = " ", col.names = F, row.names = F)
  # Powell Tier Balance Variable #
  filepath_BalVar=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Powell_Balance_Tier_Variable_DV.txt", sep = "")
  write.table(BalVar[,i],file = filepath_BalVar, sep = " ", col.names = F, row.names = F)
  # Powell Tier Release Volume Range #
  filepath_RelRange=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Powell_Range_Number_DV.txt", sep = "")
  write.table(RelRange[,i],file = filepath_RelRange, sep = " ", col.names = F, row.names = F)
  # Powell Mead Reference Volume #
  filepath_MeadRef=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Powell_Mead_Reference_Elevation_DV.txt", sep = "")
  write.table(MeadRef[,i],file = filepath_MeadRef, sep = " ", col.names = F, row.names = F)
  # Powell Equalization Increment #
  filepath_EqInc=paste("C:\\Users\\ealexander\\Desktop\\MOEA RiverSMART work\\Mead_and_Powell_Policies_331\\policy",i,"\\Powell_Increment_EQ_DV.txt", sep = "")
  write.table(EqInc[,i],file = filepath_EqInc, sep = " ", col.names = F, row.names = F)
  }


