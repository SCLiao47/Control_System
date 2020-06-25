% Step response of second-order system

tend = 5;
t_sim = linspace(0,tend,100);

%% underdamped / critically damped / overdamped
figure(1)
subplot(1,2,1); hold on; grid on;
xlim([0,tend]);
ylim([0,2]);
xlabel('Time (sec)');
ylabel('Unite Step Response');

subplot(1,2,2); hold on; grid on;
xlim([-15,1]);
ylim([-5,5]);

wn = 3;
damp = pow2(1:-1:-1);

for i = 1:length(root)
    G = tf(wn^2,[1,2*damp(i)*wn,wn^2]);
    
    p = pole(G);
    [y,t] = step(G,t_sim);    

    subplot(1,2,1);
    plot(t,y,'LineWidth',2);
    subplot(1,2,2);
    plot(real(p),imag(p),'x','LineWidth',2,'MarkerSize',10);
end
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

subplot(1,2,1);
legend('Overdamped','Critically damped', 'Underdamped');

%% 