
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then t;;
