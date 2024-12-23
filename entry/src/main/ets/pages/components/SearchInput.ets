
@Component
export struct SearchInput {
  @Prop enableKeyboardOnFocus: boolean;
  @Prop placeholderArray: string[];
  @Link searchValue: string;
  @State placeholderIndex: number = 0;
  @State intervalId: number = 0;
  onSearch: (value: string) => void = (value) => {};
  onChange?: (value: string) => void = (value) => {};

  aboutToAppear(): void {
    this.setPlaceholder();
  }

  setPlaceholder() {
    if (this.placeholderArray) {
      this.intervalId = setInterval(() => {
        this.placeholderIndex = (this.placeholderIndex + 1) % this.placeholderArray.length;
      }, 1500);
    }
  }

  aboutToDisappear(): void {
    clearInterval(this.intervalId);
  }

  build() {
    Search({
      placeholder: this.placeholderArray ? this.placeholderArray[this.placeholderIndex] : '搜索',
      value: this.searchValue
    })
      .enableKeyboardOnFocus(this.enableKeyboardOnFocus)
      .textFont({ size: 18 })
      .placeholderFont({ size: 18 })
      .height(50)
      .layoutWeight(1)
      .enterKeyType(EnterKeyType.Search)
      .onFocus(() => {
        clearInterval(this.intervalId);
      })
      .onBlur(() => {
        this.setPlaceholder();
      })
      .onChange((value: string) => {
        this.onChange?.(value);
      })
      .onSubmit((value: string) => {
        if (this.placeholderArray?.length) {
          this.onSearch(value ? value : this.placeholderArray[this.placeholderIndex]);
        } else {
          if (!value) {
            return;
          }
          this.onSearch(value);
        }
      });
  }
}
