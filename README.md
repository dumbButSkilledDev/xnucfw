# xnucfw
## WARNING: Im not responsible for any damage or any harm/negitive/anything stuff that happens!
## IMPORTANT: currently this project is designed for corelilum, but in the future it will support A11 devices and lower.
## this wont work currently, its in dev.
# componets
- falta
    loads the cfw within dfu via checkm8
- minird
    the operating system core, yes it uses a ramdisk, and uses the nand, dont ask why! (i actually dont know why i made that desision)
- sigmafier (within minird)
    prepares the OS for sigmaStrap (installs a binpack)
- sigmaStrap (within minird)
    procursus bootstraper for sigmas only