
let rec wwhile (f,b) = let temp = f b in wwhile (temp, b);;
