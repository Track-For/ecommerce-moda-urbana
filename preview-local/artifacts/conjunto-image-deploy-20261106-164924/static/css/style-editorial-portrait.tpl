/* Preserve the original photo; crop only the empty space above the model. */
.tf-editorial-module .tf-edit-lead { align-self: start; }
.tf-editorial-module .tf-edit-lead .tf-edit-media {
    position: relative;
    height: auto;
    min-height: 0;
    aspect-ratio: 3 / 4;
    overflow: hidden;
}
.tf-editorial-module .tf-edit-lead .tf-edit-image {
    position: absolute;
    inset: auto 0 0;
    display: block;
    width: 100%;
    height: auto;
    object-fit: contain;
    object-position: center bottom;
}
.tf-editorial-module .tf-edit-lead .tf-edit-caption {
    position: static;
    padding: 16px 0 0;
    color: inherit;
    background: none;
}
.tf-editorial-module .tf-edit-lead .tf-edit-title {
    font-size: clamp(24px, 3vw, 36px);
}
