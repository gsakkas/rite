TupleG (fromList [VarG,AppG (fromList [EmptyG])])
(List.append zeroes l1 , l2)
(List.append (clone 0
                    (List.length l2 - List.length l1))
             l1 , l2)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
(l1 @ clone 0 (x2 - x1) , l2)
(l1 , l2 @ clone 0 (x1 - x2))
(clone 0
       (len2 - len1) @ l1 , l2)
(clone 0
       (len1 - len2) @ l2 , l1)
(cout , List.append [r] [])
(List.append (clone 0
                    (abs diff)) l1 , l2)
(l1 , List.append (clone 0
                         diff) l2)
(List.append (clone 0
                    (length2 - length1)) l1 , l2)
(l1 , List.append (clone 0
                         (length1 - length2)) l2)
(List.append (clone 0
                    (sec - first)) l1 , l2)
(l1 , List.append (clone 0
                         (first - sec)) l2)
(first_forced , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
(b , f b)
(List.append (clone 0 (b - a))
             l1 , l2)
(l1 , List.append (clone 0
                         (a - b)) l2)
(l1 , List.append (clone 0
                         l1G) l2)
(List.append (clone 0 l2G)
             l1 , l2)
(l1 , to_append @ l2)
(l1 , clone 0 a)
(List.append (clone 0 (0 - a))
             l1 , l2)
(List.append (clone 0
                    (- diff)) l1 , l2)
(List.append (clone 0 diff)
             l2 , l1)
(func b , b)
