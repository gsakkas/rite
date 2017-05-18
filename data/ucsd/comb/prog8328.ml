
let rec wwhile (f,b) = wwhile ((f b), b);;
