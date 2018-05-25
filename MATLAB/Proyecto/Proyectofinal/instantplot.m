if i/6==floor(i/6)
figure (1)
    plot3(rax(i+1),ray(i+1),raz(i+1),'.')
    hold on
    plot3(rbx(i+1),rby(i+1),rbz(i+1),'.r')
    axis([0 s 0 s 0 s])
    hold off
    grid
end