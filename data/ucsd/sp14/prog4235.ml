
let rec wwhile (f,b) = match f b with | (a,c) -> if not c then a else f a;;
