% Step response of first-order system

tend = 5;
t_sim = linspace(0,tend,100);

%% Stable systme with different converging rate
root = pow2(2:-1:-1);

figure(1)
subplot(1,2,1); hold on; grid on;
xlim([0,tend]);
ylim([0,2]);
xlabel('Time (sec)');
ylabel('Unite Step Response');

subplot(1,2,2); hold on; grid on;
xlim([-5,1]);
ylim([-1,1]);

for i = 1:length(root)
    G = tf(root(i),[1,root(i)]);
    
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

%% Stabel and unstable system

root = -1:1;

figure(2)
subplot(1,2,1); hold on; grid on;
xlim([0,tend]);
ylim([0,2]);
xlabel('Time (sec)');
ylabel('Unite Step Response');

subplot(1,2,2); hold on; grid on;
xlim([-2,2]);
ylim([-1,1]);

for i = 1:length(root)
    G = tf(1,[1,root(i)]);
    
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