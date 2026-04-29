interface DotGridProps {
  spacing?: number;
  opacity?: number;
  className?: string;
}

export function DotGrid({ spacing = 24, opacity = 0.12, className = '' }: DotGridProps) {
  return (
    <div
      className={`absolute inset-0 pointer-events-none ${className}`}
      style={{
        opacity,
        backgroundImage: `radial-gradient(circle, hsl(45 93% 47%) 1px, transparent 1px)`,
        backgroundSize: `${spacing}px ${spacing}px`,
      }}
      aria-hidden="true"
      role="presentation"
    />
  );
}
