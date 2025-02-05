shader_type canvas_item;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float glow = smoothstep(0.3, 0.5, tex.a);
    COLOR = tex + vec4(1.0, 0.6, 0.2, 1.0) * glow * 0.5; // Tom laranja brilhante
}
