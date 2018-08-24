p_h <- c("History","History+Trend")
p_m <- c("ROC","All")
p_z <- c("Khyov","Pa Kalan")

who <- c("Sam","Chealy","Naborey","Sophyra","Khidorang",
         "Remi","Bunreth","Phyrum","Sobun","Sarith","Sophana","Pin")

distrib <- cbind(levels(interaction(p_m,p_h,p_z,sep = " - ")),sample(who))
distrib
