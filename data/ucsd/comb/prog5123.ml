
let rec wwhile (f,b) = match b with | b -> wwhile ((f b), b);;
