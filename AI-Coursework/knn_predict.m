function predictions = knn_predict(m, testExamples)

    predictions = categorical;
    trainExamples = m.train_examples;

    fileAmountTrain = size(trainExamples);
    for i = 1:fileAmountTrain-1
        trainExample = trainExamples(i);
        nextTrainExample = trainExamples(i+1);
        euclideanTrain(i,1) = knn_calculate_distance(trainExample, nextTrainExample);
        euclideanTrain(i,2) =  m.train_labels(i,1);
    end
    
    fileAmountTest = size(testExamples);
    for i = 1:fileAmountTest-1
        testExample = testExamples(i);
        nextTestExamples = testExamples(i+1);
        euclideanTest(i,1) = knn_calculate_distance(testExample, nextTestExamples);
    end

    euclideanTest(height(euclideanTrain)) = 0;
    for i = 1:size(euclideanTrain)-1
    %    for j = 1:size(euclideanTest)-1
     %       if euclideanTrain(i,1) == euclideanTest(j,1)
      %          predictions = euclideanTrain(i,2);
       %     end
            [minDistance, indexOfMin] = min(abs(euclideanTrain(i,1)-euclideanTest));
            predictions = euclideanTrain(indexOfMin,2);
        %    if euclideanTrain(i,1) == euclideanTest(j,1)
         %   end
        %end
    end

    % add your code and comments on the lines below:

end