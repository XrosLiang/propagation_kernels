
addpath(genpath('../'));

% LOAD image data
fprintf('...loading data\n')
load('plant_diseases_demo')

% NEIGHBOURHODD for diffusion
B = make_B(1,4);    % 4-neighbourhood
transformation = @(A) label_diffusion_convolution(A, B);
        
% QUANTIZATION parameter and distribution intilialization
num_col = 5; 
inital_A = prior_label_distributions_images(A,num_col);


% PK parameters
num_iter = 10;
w        = 1e-4;
distance = 'tv';
rng(0);     % initialize random seed for reproducible results
 

% COMPUTE propagation kernel for images with diffusion on pixel grid graphs
fprintf('...propagation kernel computation\n')
tic
K = propagation_kernel_matrix(inital_A, transformation, num_iter, 'distance', distance, 'w', w);
toc                     
      

% % KERNEL EVALUATION (libSVM Classification)
% fprintf('...svm evaluation\n')
% addpath(genpath('/path/to/libsvm/'))
% svm_options = @(c)(['-q -t 4 -c ' num2str(c)]);
% 
% num_folds = 10; 
% cost = 1;
% c = cvpartition(numel(labels),'kfold',num_folds);  % generate data splits
% 
% accurracies = zeros(num_folds, 1);
% for i=1:num_folds
%     train_ind = find(training(c,i)==1);
%     test_ind = find(training(c,i)==0);  
% 
%     K_train = [(1:length(train_ind))' K(train_ind,train_ind)];
%     K_test = [(1:length(test_ind))' K(test_ind,train_ind)];
% 
%     % SVM prediciton
%     model = svmtrain_libsvm(labels(train_ind),K_train, svm_options(cost));
%     [y_pred, acc, ~] = svmpredict(labels(test_ind),K_test, model, '-q');
%     accurracies(i) = acc(1);
% end
% fprintf('%d-fold CV accuracy (+/- stdv) = %2.2f (+/- %0.2f) \n',num_folds,mean(accurracies),std(accurracies))                     






                    
                    
                    
