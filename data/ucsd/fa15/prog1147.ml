
let rec wwhile (f,b) = match b with | b -> f b wwhile ((f b), b);;
