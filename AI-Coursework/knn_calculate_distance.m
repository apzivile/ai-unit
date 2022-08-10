function d = knn_calculate_distance(p, q)

    d = sqrt(sum((p - q).^ 2));
    
end