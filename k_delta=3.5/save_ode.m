save('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_h_ccl.txt', 'rho_plot_h','-ascii');
% save('N=2000_k1=20_k21=6_ode_lambda_delta=0.16_l_c.txt', 'rho_plot_l','-ascii');
save('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_lambda1_plot_ccl.txt', 'lambda1_plot','-ascii');

%精细部分时间为80000，后缀为_x
%粗糙部分时间为10000，后缀为_c
%更粗糙部分时间为1000，后缀为_cl和_cr，代表左和右