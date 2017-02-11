
let rec wwhile (f,b) = let (bs,cs) = f b in if cs then f bs else bs;;
