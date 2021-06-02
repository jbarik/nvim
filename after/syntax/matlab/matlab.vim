syn keyword matlabTodo	 contained  TODO NOTE FIXME XXX
syn keyword matlabStatement	return function

" String
syn region matlabString	start=+'+ end=+'+ oneline contains=@Spell

syn match matlabTab "\t"
syn match matlabOperator "\v\."
syn match matlabOperator "\v\="
syn match matlabOperator "(\|)"
syn match matlabOperator /\[/
syn match matlabOperator /\]/
syn match matlabOperator "{\|}"
syn match matlabOperator ",\|;\|:"
syn match matlabLineContinuation "\.\{3}"

" Standard numbers
syn match matlabNumber	"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match matlabFloat	"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match matlabFloat	   "\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"
syn keyword matlabConstant eps Inf NaN pi


" Transpose character and delimiters: Either use just [...] or (...) aswell
syn match matlabTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

syn match matlabComment	      "%.*$"	contains=matlabTodo,matlabTab,@Spell
syn region matlabBlockComment start=+%{+ end=+%}+ contains=matlabBlockComment,@Spell

syn keyword matlabInbuiltFunc intersect ismember issorted setdiff setxor union unique
syn keyword matlabInbuiltFunc regexpi regexprep regexptranslate strfind strtok evalc evalin strncmp strncmpi
syn keyword matlabInbuiltFunc double int8 int16 int32 int64 single typecast uint8 uint16 uint32 uint64
syn keyword matlabInbuiltFunc clf close closereq drawnow gcf hgload hgsave newplot opengl refresh
syn keyword matlabInbuiltFunc axis cla grid ishold makehgtform linkaxes linkprop refreshdata
syn keyword matlabInbuiltFunc tetramesh trimesh triplot trisurf dde23 ddeget ddesd ddeset
syn keyword matlabInbuiltFunc convhulln voronoin cart2pol cart2sph pol2cart sph2cart
syn keyword matlabInbuiltFunc plotmatrix scatter scatter3 getframe im2frame movie  noanimate
syn keyword matlabInbuiltFunc frame2im image imagesc imfinfo imformats imread imwrite ind2rgb
syn keyword matlabInbuiltFunc allchild ancestor copyobj delete gca gco get ishandle propedit set
syn keyword matlabInbuiltFunc isvalid start startat stop timer timerfind timerfindall wait
syn keyword matlabInbuiltFunc ans assert builtin pause run script symvar varargin varargout
syn keyword matlabInbuiltFunc base2dec bin2dec hex2dec hex2num str2double str2num unicode2native
syn keyword matlabInbuiltFunc bitand bitcmp bitget bitmax bitor bitset bitshift bitxor swapbytes
syn keyword matlabInbuiltFunc blanks isletter isspace isstrprop validatestring deblank lower upper
syn keyword matlabInbuiltFunc atan atan2 atand atanh cos cosd cosh cot cotd coth csc cscd csch hypot sec secd
syn keyword matlabInbuiltFunc expm logm cholupdate planerot qrdelete qrinsert qrupdate qz accumarray bsxfun cross dot kron tril triu
syn keyword matlabInbuiltFunc frameedit hgexport orient print printopt saveas interp1 interp2 interp3 interpn mldivide mrdivide
syn keyword matlabInbuiltFunc brush cumprod cumsum linkdata prod sort sortrows sum all and any iskeyword isvarname not or xor
syn keyword matlabInbuiltFunc comet comet3 compass feather quiver quiver3 stairs stem stem3 guidata guihandles movegui openfig
syn keyword matlabInbuiltFunc sech sin sind sinh tan tand tanh isfinite isinf isnan isnumeric isreal isscalar
syn keyword matlabInbuiltFunc ceil fix floor idivide mod rem round isvector permute realmax realmin reshape squeeze zeros
syn keyword matlabInbuiltFunc abs angle complex conj cplxpair  imag real sign unwrap strjust strmatch strread strrep strtrim strvcat
syn keyword matlabInbuiltFunc factor factorial gcd isprime lcm nchoosek perms primes rat rats findall findfigs findobj gcbf gcbo
syn keyword matlabInbuiltFunc acos acosd acosh acot acotd acoth acsc acscd acsch asec asecd asech asin asind asinh
syn keyword matlabInbuiltFunc exp expm1 log log10 log1p log2 nextpow2 nthroot pow2 reallog realpow realsqrt sqrt
syn keyword matlabInbuiltFunc conv deconv poly polyder polyeig polyfit polyint polyval polyvalm residue roots
syn keyword matlabInbuiltFunc arrayfun cast cat class find intmax intmin intwarning ipermute isa isequal isequalwithequalnans
syn keyword matlabInbuiltFunc cellstr char eval findstr isstr regexp sprintf sscanf strcat strcmp strcmpi strings
syn keyword matlabInbuiltFunc cell2struct deal fieldnames getfield  isfield isstruct orderfields rmfield setfield struct struct2cell structfun
syn keyword matlabInbuiltFunc cell cell2mat celldisp cellfun cellplot iscell iscellstr mat2cell num2cell feval func2str functions str2func
syn keyword matlabInbuiltFunc clear depfun exist im2java inmem javaaddpath javaArray javachk Generate javaclasspath javaMethod javaObject javarmpath methodsview usejava which
syn keyword matlabInbuiltFunc ischar isfloat isinteger isjava islogical isobject validateattributes who whos
syn keyword matlabInbuiltFunc dec2base dec2bin dec2hex int2str mat2str native2unicode num2str datestr logical num2hex str2mat
syn keyword matlabInbuiltFunc dialog errordlg export2wsdlg helpdlg inputdlg listdlg msgbox printdlg printpreview questdlg uigetdir uigetfile uigetpref uiopen uiputfile uisave uisetcolor uisetfont waitbar warndlg
syn keyword matlabInbuiltFunc addpref getappdata getpref ginput guide inspect isappdata ispref rmappdata rmpref setappdata setpref uisetpref waitfor waitforbuttonpress
syn keyword matlabInbuiltFunc uibuttongroup uicontextmenu uicontrol uimenu uipanel uipushtool uitoggletool uitoolbar menu
syn keyword matlabInbuiltFunc align getpixelposition listfonts selectmoveresize setpixelposition textwrap uistack
syn keyword matlabInbuiltFunc uiresume uiwait box errorbar hold  loglog  plot plot3 plotyy polar semilogx semilogy subplot
syn keyword matlabInbuiltFunc figurepalette pan plotbrowser plotedit plottools propertyeditor rotate3d  showplottool zoom
syn keyword matlabInbuiltFunc annotation clabel datacursormode datetick gtext legend  line rectangle texlabel title xlabel ylabel zlabel
syn keyword matlabInbuiltFunc area bar barh bar3 bar3h pareto pie pie3 contour contour3  contourc contourf ezcontour ezcontourf
syn keyword matlabInbuiltFunc ezmesh ezmeshc ezplot ezplot3 ezpolar ezsurf ezsurfc fplot hist histc rose
syn keyword matlabInbuiltFunc convhull cylinder delaunay delaunay3 delaunayn dsearch dsearchn ellipsoid fill fill3 inpolygon pcolor  polyarea rectint ribbon slice sphere tsearch tsearchn voronoi waterfall
syn keyword matlabInbuiltFunc axes figure hggroup hgtransform light patch surface text fft fft2 fftn fftshift fftw ifft ifft2 ifftn ifftshift
syn keyword matlabInbuiltFunc corrcoef cov max mean median min mode std var conv2 convn detrend filter filter2
syn keyword matlabInbuiltFunc cd copyfile dir fileattrib filebrowser isdir lookfor ls matlabroot mkdir movefile pwd recycle rehash rmdir toolboxdir type what
syn keyword matlabInbuiltFunc clipboard computer dos getenv hostid maxNumCompThreads perl setenv system unix winqueryreg
syn keyword matlabInbuiltFunc ismac ispc isstudent isunix javachk license prefdir usejava ver verLessThan version
syn keyword matlabInbuiltFunc disp display isempty issparse length ndims numel size cumtrapz del2 diff gradient trapz
syn keyword matlabInbuiltFunc blkdiag diag eye freqspace ind2sub linspace logspace meshgrid ndgrid ones rand randn sub2ind
syn keyword matlabInbuiltFunc circshift flipdim fliplr flipud horzcat inline repmat rot90 shiftdim vectorize vertcat
syn keyword matlabInbuiltFunc compan gallery hadamard hankel hilb invhilb magic pascal rosser toeplitz vander wilkinson
syn keyword matlabInbuiltFunc cond condeig det norm normest null orth rank rcond rref subspace trace
syn keyword matlabInbuiltFunc chol cholinc condest funm ilu inv linsolve lscov lsqnonneg lu luinc pinv qr
syn keyword matlabInbuiltFunc balance cdf2rdf eig eigs gsvd hess ordeig ordqz ordschur rsf2csf schur sqrtm ss2tf svd svds
syn keyword matlabInbuiltFunc griddata griddata3 griddatan interp1q interpft mkpp padecoef pchip ppval spline unmkpp
syn keyword matlabInbuiltFunc decic deval ode15i ode23 ode45 ode113 ode15s ode23s ode23t ode23tb odefile odeget odeset odextend
syn keyword matlabInbuiltFunc bvp4c bvp5c bvpget bvpinit bvpset bvpxtend pdepe pdeval spdiags speye sprand sprandn sprandsym
syn keyword matlabInbuiltFunc fminbnd fminsearch fzero optimget optimset dblquad quad quadgk quadl quadv triplequad
syn keyword matlabInbuiltFunc airy besselh besseli besselj besselk bessely beta betainc betaln ellipj ellipke erf erfc erfcx erfinv erfcinv expint gamma gammainc gammaln legendre psi
syn keyword matlabInbuiltFunc full sparse spconvert nnz nonzeros nzmax spalloc spfun spones spparms spy
syn keyword matlabInbuiltFunc spaugment sprank amd colamd colperm dmperm ldl randperm symamd symrcm iqr
syn keyword matlabInbuiltFunc etree etreeplot gplot symbfact treelayout treeplot bicg bicgstab cgs gmres lsqr minres pcg qmr symmlq
syn keyword matlabInbuiltFunc getdatasamplesize getqualitydesc timeseries tsprops tstool tscollection
syn keyword matlabInbuiltFunc addsample ctranspose delsample getabstime getinterpmethod getsampleusingtime idealfilter resample setabstime setinterpmethod synchronize transpose
syn keyword matlabInbuiltFunc addevent delevent gettsafteratevent gettsafterevent gettsatevent gettsbeforeatevent gettsbeforeevent  gettsbetweenevents
syn keyword matlabInbuiltFunc addsampletocollection addts delsamplefromcollection gettimeseriesnames removets settimeseriesnames
syn keyword matlabInbuiltFunc addtodate calendar clock cputime date datenum datevec eomday etime now weekday
syn keyword matlabInbuiltFunc addOptional addParamValue addRequired createCopy depdir echo input inputname inputParser mfilename namelengthmax nargchk nargin nargout nargoutchk parse pcode
syn keyword matlabInbuiltFunc assignin datatipinfo genvarname isglobal memory mislocked mlock munlock pack
syn keyword matlabInbuiltFunc addCause error ferror getReport last lasterr lasterror lastwarn warning
syn keyword matlabInbuiltFunc addlistener addprop dynamicprops hdf hdf5 hdf5info hdf5read hdf5write hdfinfo hdfread hdftool
syn keyword matlabInbuiltFunc findprop getdisp handle hgsetget inferiorto loadobj metaclass notify saveobj setdisp subsasgn subsindex subsref substruct superiorto
syn keyword matlabInbuiltFunc filemarker fileparts filesep fullfile tempdir tempname memmapfile xlsfinfo xlsread xlswrite
syn keyword matlabInbuiltFunc daqread filehandle importdata load open save uiimport winopen wk1finfo wk1read wk1write
syn keyword matlabInbuiltFunc fclose feof fgetl fgets fopen fprintf fread frewind fscanf fseek ftell fwrite
syn keyword matlabInbuiltFunc csvread csvwrite dlmread dlmwrite textread textscan xmlread xmlwrite xslt
syn keyword matlabInbuiltFunc cdfepoch cdfinfo cdfread cdfwrite todatenum fitsinfo fitsread multibandread multibandwrite

" Define the default highlighting.
syn keyword matlabQualifier Static Access
"syn match matlabDelimiter     ",\|;\|:"
syn match matlabInbuiltFunctionCall  "\w\+\s*(\@="

"hi def link Delimiter                 matlabDelimiter
hi def link matlabQualifier           StorageClass
hi def link matlabInbuiltFunctionCall Function

hi def link matlabTodo		          Todo
hi def link matlabFloat		          Float
hi def link matlabScope	            StorageClass
hi def link matlabString            String
hi def link matlabNumber	          Number
hi def link matlabComment	          Comment
hi def link matlabOperator          Operator
hi def link matlabConstant	        Constant
hi def link matlabStatement	        Statement
hi def link matlabDelimiter	        Operator
hi def link matlabInbuiltFunc       Identifier
hi def link matlabBlockComment	    Comment
hi def link matlabTransposeOther    Identifier
hi def link matlabLineContinuation  Delimiter
hi def link matlabTransposeOperator matlabOperator


