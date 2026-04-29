interface GradientMeshProps {
  colors?: string[];
  animated?: boolean;
  opacity?: number;
  className?: string;
}

export function GradientMesh({
  colors = ['hsl(45 93% 47% / 0.08)', 'hsl(45 93% 47% / 0.04)', 'hsl(215 25% 27% / 0.1)'],
  animated = false,
  opacity = 1,
  className = '',
}: GradientMeshProps) {
  return (
    <div
      className={`absolute inset-0 pointer-events-none overflow-hidden ${className}`}
      style={{ opacity }}
      aria-hidden="true"
      role="presentation"
    >
      {colors.map((color, i) => (
        <div
          key={i}
          className="absolute rounded-full"
          style={{
            background: `radial-gradient(circle, ${color}, transparent 70%)`,
            width: '60%',
            height: '60%',
            top: `${15 + i * 20}%`,
            left: `${10 + i * 25}%`,
            ...(animated ? { animation: `float ${6 + i * 2}s ease-in-out infinite`, animationDelay: `${i * 500}ms` } : {}),
          }}
        />
      ))}
    </div>
  );
}
