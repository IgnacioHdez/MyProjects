if i/5==floor(i/5)
figure (1)
    plot3(rax(i+1),ray(i+1),raz(i+1),'.')
    hold on
    plot3(rbx(i+1),rby(i+1),rbz(i+1),'.r')
    axis([-0.1*s s+0.1*s -0.1*s s+0.1*s -0.1*s s+0.1*s])
    hold off
    grid
end