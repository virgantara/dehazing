function BLKS = imsplit(I,N,DIMS)
%IMSPLIT - Divide matrix or image into blocks according to criteria
%  BLKS = imsplit(I,N)
%  Gives cell array BLKS containing subsections of ND-matrix/image I. 
%  N is a vector or scalar defining divisions per dimension.
%  N must contain integer values > 1
%  A scalar N is re-used for all operand dimensions.
%  E.g. N=5 for 3 dimensions is equivalent to N=[5 5 5] and requires all
%  three dimensions to be divisible by 5. Uses dimensions 1&2 by default.
%
%
%  BLKS = imsplit(I,N,DIMS)
%  Cuts along dimensions DIMS. If omitted, DIMS = 1:2
%  DIMS is an array listing dimensions, e.g. [2 3] or a scalar.
%  length(DIMS) == length(N) if N is not a scalar. 
%  Only specify DIMS intended for dividing. 
%  E.g. to divide a matrix's 2nd and 3rd dimensions by  4 and 6 
%  respectively, DIMS = [2 3] and N = [4 6]. Leaves other dims untouched.
%
%  If I is a vector, specify appropriate dimension (1 for col, 2 for row).
%
%  --- Example: 2D
%  I    = imread('cameraman.tif'); %256x256 uint8 image
%  set1 = imsplit(I,2);     % Create 2x2 subimages
%  set2 = imsplit(I,2,1);   % Create 2x1 subimages, ie split 1st dimension
%  set3 = imsplit(I,2,2);   % Create 1x2 subimages, ie left + right split
%  set4 = imsplit(I,[2 4]); % Create 2x4 subimages
%
% --- Example: 3D
%  J    = imread('peppers.png');  % 384x512x3 uint8 RGB image
%  set1 = imsplit(J,3,3);         %Create 1x1x3 subimages, split by color plane
%  set2 = imsplit(J,[2 2 3],1:3); %split into 2x2x3 cell array, splitting
%         each color plane into 2x2 submatrices.
%  set3 = imsplit(J,4);           %split into 4x4 array of RGB images
%
% --- Example: ND
% K = single(rand(384,512,6,2));
% set1 = imsplit(K,[2 4 3 2],1:4); 
% Produces a [2 4 3 2] cell array containing matrices of type single and
% size 192x256x2


% --- Parse input && Calculate secondary variables:
% (D,ND,SZ,N,BLKS)
%assert((nargin>1) && (nargin<4) && all(N>1),...
 %   'Wrong Syntax, type "help imsplit" or check arguments''Remember: divide by integers > 1');

 if((nargin>1) && (nargin<4) && all(N>1) && (length(unique(DIMS))== length(DIMS)))
else
    error(sprintf('Wrong Syntax, type "help imsplit" or check arguments\n Remember: divide by integers > 1'));
end

ND   = ndims(I);
SZ   = size(I);
if nargin == 2
    DIMS = [1 2]; %default.
    assert(length(I)~=numel(I),'I is a vector!');
else
    DIMS = sort(DIMS);
    assert(~any(DIMS>ND),'Attempt to split non-existant dimension')
end
D    = length(DIMS);

if isscalar(N)
    N    = repmat(N,[1 D]);
    if D==1
    v = ones(1,ND);
    v(DIMS) = N;
    BLKS = cell(v); clear v
    else
    BLKS = cell(N);
    end
else
    assert(length(N) == D,'N does not correspond with DIMS');
    BLKS = cell(N);
end


% --- Check if all divisible:
assert(~all(mod(SZ(DIMS),N)),...
    'Can not divide one or more dimensions by given number(s)')

% --- Split:
%(must permute for DIMS ~= 1 because chop() only works on 1st dimension)
BLKS{1} = I;
for ii = 1:D % for every dimension given in DIMS
    dim = DIMS(ii);                %operand dimension
    n   = N(ii);                   %divisor
    idx = linspace(0,SZ(dim),n+1); %chopping points for chop()
    pvec = getpvec(dim,ND);        %helps turn cube for chopping
    
    %Chop every submat and re-dump to BLKS:
    % allocate in chunk sizes n
    BLKS = cellfun(@(X)permute(X,pvec),BLKS,'UniformOutput',false); %cube(s) turned   
    nsubs = prod(N(1:ii-1)); %current no. submats in BLKS
    NEWBLKS = BLKS;
    for jj = 1:nsubs    
    ix = 1+(jj-1)*n;   
    NEWBLKS(ix:ix+n-1) = chop(BLKS{jj},idx,n); %assign new cells to NEWBLKS *linear indexing*
    end    
    BLKS = NEWBLKS;
    BLKS = cellfun(@(X)permute(X,pvec),BLKS,'UniformOutput',false); %cube(s) turned back   
end

if D >1 %Correct for linear indexing (quick fix)
    pv = ones(1,ND);
    pv(DIMS) = N;
    pv = cell(pv); %proper shape includes singletons
    pv = permute(pv,ND:-1:1);
    pv(:) = BLKS(:);
    pv = permute(pv,ND:-1:1);
    BLKS = pv;
end

% --- Local functions
function pvec = getpvec(dim,ND)
    pvec = 1:ND;
    pvec(pvec==dim) = 1;
    pvec(1) = dim;

function sub = chop(mat,idx,N)
% cuts matrix into N submatrices along 1st dim.
% retains sizes other than size(mat,1) (for ND>2 mats)
% Outputs cell array
sub   = cell(1,N);
ss    = size(mat);
ss(1) = idx(2);
    for ii = 1:N   
        sub{ii} = reshape(mat(idx(ii)+1:idx(ii+1),:),ss); %mind brackets          
    end   
       
